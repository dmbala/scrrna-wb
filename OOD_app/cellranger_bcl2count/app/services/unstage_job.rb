class UnstageJob
  def initialize(job)
    @job = StagedJob.new(job)
  end

  def call
    ActiveRecord::Base.transaction do
      unstage_directory
      job.update! staged: false
    end
  rescue => e
    Rails.logger.error "Unstage job: #{e.message}"
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true, error: nil)
  end

  private
    attr_reader :job

    def unstage_directory
      job.staged_root.rmtree if job.staged_root.try(:exist?)
    end
end
