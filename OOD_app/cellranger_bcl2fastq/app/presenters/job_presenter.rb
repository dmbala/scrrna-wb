class JobPresenter < SimpleDelegator
  def initialize(job)
    super

    update_job_status
  end

  def queued?
    !!job_status.try(:queued?)
  end

  def queued_held?
    !!job_status.try(:queued_held?)
  end

  def running?
    !!job_status.try(:running?)
  end

  def suspended?
    !!job_status.try(:suspended?)
  end

  def status_color
    if !staged?
      "light"
    elsif unsubmitted?
      "secondary"
    elsif queued?
      "info"
    elsif queued_held?
      "info"
    elsif running?
      "primary"
    elsif suspended?
      "info"
    elsif completed?
      "success"
    else
      "danger"
    end
  end

  def status_title
    if !staged?
      "Unstaged"
    elsif unsubmitted?
      "Staged"
    elsif queued?
      "Queued"
    elsif queued_held?
      "Held"
    elsif running?
      "Running"
    elsif suspended?
      "Suspended"
    elsif completed?
      "Completed"
    else
      "Unknown"
    end
  end

  def files_url
    OodAppkit.files.url(path: staged_root).to_s if staged_root
  end

  private
    attr_reader :job_status

    def staged_root
      StagedJob.new(self).staged_root
    end

    def update_job_status
      @job_status = UpdateJobStatus.new(self).call.status
    end
end
