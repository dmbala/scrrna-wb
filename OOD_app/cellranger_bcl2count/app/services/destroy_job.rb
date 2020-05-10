class DestroyJob
  def initialize(job)
    @job = job
  end

  def call
    if job.submitted?
      result = StopJob.new(job).call
      raise result.error unless result.success?
    end
    if job.staged?
      result = UnstageJob.new(job).call
      raise result.error unless result.success?
    end
    job.destroy!
  rescue => e
    Rails.logger.error "Destroy job: #{e.message}"
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true, error: nil)
  end

  private
    attr_reader :job
end
