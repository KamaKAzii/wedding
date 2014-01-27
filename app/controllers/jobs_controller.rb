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

  def edit
    @marriage = Marriage.find(params[:marriage_id])
    @job = Job.find(params[:id])
  end

  def update
    @marriage = Marriage.find(params[:marriage_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash.notice = "Successfully edited job"
      if current_user
        redirect_to user_path(current_user.id)
      else
        redirect_to root_path
      end
    else
      render "edit"
    end
  end

  def tag_search
    terms_array = tag_search_params[:terms]
      .split(",")
      .collect(&:strip)
    @jobs = Job.tag_search(terms_array)
    render "search_results"
  end

  private

  def job_params
    params
      .require(:job)
      .permit(
        :title,
        :description,
        :tag_list,
        "date(3i)",
        "date(2i)",
        "date(1i)")
  end

  def tag_search_params
      params
        .require(:job)
        .permit(
          :terms)
  end

end
