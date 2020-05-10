class StagedJob < SimpleDelegator
  attr_reader :dataroot

  def initialize(job, opts = {})
    super(job)

    raise "Object does not respond to :staged_name" unless respond_to?(:staged_name)

    opts = opts.to_h.compact.symbolize_keys
    @dataroot = Pathname.new opts.fetch(:dataroot, OodAppkit.dataroot).to_s
  end

  def staged_root
    if staged_name
      dataroot.join(staged_name).tap { |p| p.mkpath unless p.exist? }
    end
  end
end
