class JobsController < ApplicationController
  
  def new
    @marriage = Marriage.find(params[:marriage_id])
    @job = Job.new
  end

  def create
    @marriage = Marriage.find(params[:marriage_id])
    @job = Job.new(job_params)
    @job.marriage = @marriage
    if @job.save
      flash.notice = "Job successfully added"
      if current_user
        redirect_to user_path(current_user.id)
      else
        redirect_to root_path
      end
    else
      render "new"
    end
  end

  private

  def job_params
    params
      .require(:job)
      .permit(
        :title,
        :description,
        "date(3i)",
        "date(2i)",
        "date(1i)")
  end

end
