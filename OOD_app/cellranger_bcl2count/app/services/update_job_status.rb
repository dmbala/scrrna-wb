class UpdateJobStatus
  def initialize(job)
    @job = SubmittedJob.new(job)
  end

  def call
    if job.submitted?
      status = nil
      ActiveRecord::Base.transaction do
        status = get_job_status
        job.completed! if status.completed?
      end
    end
  rescue => e
    Rails.logger.error "Update job status: #{e.message}"
    OpenStruct.new(success?: false, status: nil, error: e.message)
  else
    OpenStruct.new(success?: true, status: status, error: nil)
  end

  private
    attr_reader :job

    def get_job_status
      id = job.job_id || raise("No job id specified.")
      job.adapter!.status id
    end
end
