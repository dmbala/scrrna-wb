class StageTemplate
  def initialize(job, opts = {})
    @job = StagedJob.new(job)

    opts = opts.to_h.compact.symbolize_keys
    @template_root =
      Pathname.new(
        opts.fetch(:template_root, Rails.root.join("template")).to_s
      )
  end

  def call
    ActiveRecord::Base.transaction do
      job.update!(staged_name: staged_name) unless job.staged_name
      stage_directory
      render_erb_files
      job.update! staged: true
    end
  rescue => e
    job.staged_root.rmtree if job.staged_root.try(:exist?)
    Rails.logger.error "Stage template: #{e.message}"
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true, error: nil)
  end

  private
    attr_reader :job
    attr_reader :template_root

    def staged_name
      "job_#{DateTime.now.to_s(:number)}_#{SecureRandom.hex(4)}"
    end

    def stage_directory
      oe, s = Open3.capture2e("rsync", "-a", "#{template_root}/", "#{job.staged_root}")
      raise oe unless s.success?
    end

    def renderable_files
      Pathname.glob(job.staged_root.join("**", "*.erb")).select(&:file?)
    end

    def job_params_binding
      OpenStruct.new(job.job_params).instance_eval { binding }
    end

    def render_erb_files
      renderable_files.each do |file|
        rendered_file = file.sub_ext("")
        template = file.read
        rendered = ERB.new(template, nil, "-").result(job_params_binding)
        file.rename rendered_file     # keep same file permissions
        rendered_file.write(rendered)
      end
    end
end
