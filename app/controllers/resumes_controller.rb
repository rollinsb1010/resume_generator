class ResumesController < ApplicationController
  respond_to :html, :except => [:show]
  respond_to :pdf, :only => [:show]

  def index
    @resumes = Resume.all
    respond_with(@resumes)
  end

  def show
    @resume = Resume.find(params[:id])
    respond_with(@resume) do |format|
      format.pdf do
        render  :pdf              => "resume",
                :show_as_html     => params[:debug].present?
      end
    end
  end

  def new
    @resume = Resume.new
    respond_with(@resume)
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.save
    respond_with(@resume)
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.update_attributes(resume_params)
    respond_with(@resume)
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    respond_with(@resume)
  end


  protected

  def resume_params
    params.require(:resume).permit(:first_name, :last_name, :intro, :projects_attributes)
  end
end
