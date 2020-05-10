class Job < ActiveRecord::Base
  # Required parameters
  enum status: [:unsubmitted, :submitted, :completed]
  store :job_params, coder: JSON

  # Hooks
  after_initialize :set_defaults

  # Set default values
  def set_defaults
    self.cluster_id ||= "amarel"
  end
  # Custom parameters
  store_accessor :job_params, :project
  store_accessor :job_params, :jobTime
  store_accessor :job_params, :bclDirectory
  store_accessor :job_params, :sampleCsvFile
  store_accessor :job_params, :sampleChem
  store_accessor :job_params, :refGenome
  store_accessor :job_params, :idName 
  store_accessor :job_params, :scratchDir 
  store_accessor :job_params, :outputDataDir 
  store_accessor :job_params, :notes

  # Validations
  validates :project, :jobTime, :bclDirectory, :sampleCsvFile, :sampleChem, :refGenome, :idName, :scratchDir, :outputDataDir, presence: true
end



