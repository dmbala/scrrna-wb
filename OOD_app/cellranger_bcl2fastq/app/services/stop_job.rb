class StopJob
  def initialize(job)
    @job = SubmittedJob.new(job)
  end

  def call
    if job.submitted?
      ActiveRecord::Base.transaction do
        stop_job
        job.completed!
      end
    end
  rescue => e
    Rails.logger.error "Stop job: #{e.message}"
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true, error: nil)
  end

  private
    attr_reader :job

    def stop_job
      job.adapter!.delete(job.job_id)
    end
end
