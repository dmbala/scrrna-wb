class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.map { |job| JobPresenter.new(job) }
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = JobPresenter.new Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /jobs/1/stage
  # PATCH /jobs/1/stage.json
  def stage
    @job = Job.find(params[:id])

    result = StageTemplate.new(@job).call
    respond_to do |format|
      if result.success?
        format.html { redirect_to jobs_url, notice: "Job was successfully staged." }
        format.json { head :no_content }
      else
        format.html { redirect_to jobs_url, alert: result.error }
        format.json { render json: { error: result.error }, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /jobs/1/submit
  # PATCH /jobs/1/submit.json
  def submit
    @job = Job.find(params[:id])

    result = SubmitJob.new(@job).call
    respond_to do |format|
      if result.success?
        format.html { redirect_to jobs_url, notice: "Job was successfully submitted." }
        format.json { head :no_content }
      else
        format.html { redirect_to jobs_url, alert: result.error }
        format.json { render json: { error: result.error }, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /jobs/1/stop
  # PATCH /jobs/1/stop.json
  def stop
    @job = Job.find(params[:id])

    result = StopJob.new(@job).call
    respond_to do |format|
      if result.success?
        format.html { redirect_to jobs_url, notice: "Job was successfully stopped." }
        format.json { head :no_content }
      else
        format.html { redirect_to jobs_url, alert: result.error }
        format.json { render json: { error: result.error }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])

    result = DestroyJob.new(@job).call
    respond_to do |format|
      if result.success?
        format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to jobs_url, alert: result.error }
        format.json { render json: { error: result.error }, status: :unprocessable_entity }
      end
    end
  end

  private
    def job_params
      params.require(:job).permit!
    end
end
