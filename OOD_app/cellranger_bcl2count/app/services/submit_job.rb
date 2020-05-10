class SubmitJob
  def initialize(job, opts = {})
    @job = SubmittedJob.new(StagedJob.new(job))

    opts = opts.to_h.compact.symbolize_keys
    @job_prefix  = opts.fetch(:job_prefix, Configuration.job_prefix).to_s
    @script_name = opts.fetch(:script_name, Configuration.script_name).to_s
  end

  def call
    if !job.staged?
      raise "Job is not staged."
    elsif job.submitted?
      raise "Job already submitted."
    else
      job_id = nil
      ActiveRecord::Base.transaction do
        job_id = submit_job
        job.update! job_id: job_id
        job.submitted!
      end
    end
  rescue => e
    adapter!.delete(job_id) if job_id
    Rails.logger.error "Submit job: #{e.message}"
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true, error: nil)
  end

  private
    attr_reader :job
    attr_reader :job_prefix
    attr_reader :script_name

    def script
      staged_root = job.staged_root

      OodCore::Job::Script.new(
        content:  staged_root.join(script_name).read,
        workdir:  staged_root,
        job_name: "#{job_prefix}/#{staged_root.basename}"
      )
    end

    def submit_job
      job.adapter!.submit(script)
    end
end
