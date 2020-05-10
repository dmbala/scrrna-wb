class SubmittedJob < SimpleDelegator
  def initialize(job)
    super(job)

    raise "Object does not respond to :cluster_id" unless respond_to?(:cluster_id)
    raise "Object does not respond to :job_id"     unless respond_to?(:job_id)
  end

  def cluster_id
    super.try(:to_sym)
  end

  def cluster
    OodAppkit.clusters[cluster_id]
  end

  def cluster_title
    cluster.try(:metadata).try(:title) || cluster_id.to_s.titleize
  end

  def adapter!
    raise("Nonexistent cluster id: '#{cluster_id}'.") unless cluster

    if cluster.job_allow?
      cluster.job_adapter
    else
      raise "You do not have permission to access cluster: '#{cluster_title}'."
    end
  end
end
