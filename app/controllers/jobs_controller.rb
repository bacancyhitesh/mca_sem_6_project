#Riddhi
class JobsController < ApplicationController
  #Ketan
  def index
    ids=current_employer.companies.ids
    @jobs=Job.where(company_id: ids)
  end
#Ketan
#Pratik
  def list
    #@jobs =Job.find(params[:search])
    if params[:city_id]
      @jobs=Job.where(company_id: Company.where(city_id: params[:city_id],industry_type_id: params[:indu_id]),status: "Active")
        else
      @jobs=Job.all
    end
    @page=@jobs.page(params[:page]) # pagination  by Ankita

  end
#Pratik
  def new
	   @job=Job.new
  end
  def create
	  @job=Job.create(jobs_param)
  	if @job.save
  		redirect_to jobs_url
  	else
  		render "new"
  	end
  end
  def show

  	@job=Job.find(params[:id])
  end
  def destroy
  	@job=Job.find(params[:id])
  	@job.destroy
	  redirect_to jobs_url
  end

  def edit
	  @job = Job.find(params[:id])
  end
  def update
  	@job = Job.find(params[:id])
  	@job.update_attributes(jobs_param)
  	redirect_to jobs_url
  end

private
  def jobs_param
	   params.require(:job).permit(:company_id,:job_type_id,:role_id,:contact_person_id,:vacancy,:description,:salary,:address,:experience,:start_date,:end_date,:education_id,:status,:user_skills)
  end
end
