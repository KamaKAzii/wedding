class JobsController < ApplicationController
  
  def new
    @marriage = Marriage.joins(:user).where(["user_id = ?", current_user.id]).last
    @job = Job.new
  end

  def create
    @marriage = Marriage.joins(:user).where(["user_id = ?", current_user.id]).last
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
    @marriage = Marriage.joins(:user).where(["user_id = ?", current_user.id]).last
    @job = current_resource
  end

  def update
    @job = current_resource
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

  def theme_search
    terms_array = theme_search_params[:theme_terms]
      .split(",")
      .collect(&:strip)
    @jobs = Job.theme_search(terms_array)
    render "search_results"
  end

  def tag_search
    terms_array = tag_search_params[:tag_terms]
      .split(",")
      .collect(&:strip)
    @jobs = Job.tag_search(terms_array)
    render "search_results"
  end
  
  def keyword_search
    terms = keyword_search_params[:keyword_terms]
    @jobs = Job.keyword_search(terms)
    render "search_results"
  end

  private

  def current_resource
    @current_resource = Job.find(params[:id]) if params[:id]
  end

  def job_params
    params
      .require(:job)
      .permit(
        :title,
        :description,
        :tag_list,
        :theme_list,
        "date(3i)",
        "date(2i)",
        "date(1i)")
  end
  def theme_search_params
      params
        .require(:job)
        .permit(
          :theme_terms)
  end

  def tag_search_params
      params
        .require(:job)
        .permit(
          :tag_terms)
  end

  def keyword_search_params
      params
        .require(:job)
        .permit(
          :keyword_terms)
  end

end
