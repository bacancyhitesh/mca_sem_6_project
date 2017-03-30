#Ketan
class JobAppliesController < ApplicationController
  def index
    @job=Job.find(params[:jobid])
    @job_users=@job.users.where(job_applies: {seen: false})
    @job_users1=@job.users.where(job_applies: {seen: true,rejected: false})
    @job_user_rejects=@job.users.where(job_applies: {rejected: true})
  end
  def total
    @job=Job.find(params[:jobid])
    @job_users1=@job.users
  end
  def download
    @job=Job.find(params[:jobid])
    @job_user=@job.users.where(job_applies: {user_id: params[:user]}).last
    @file = File.join(Rails.root, @job_user.resume.url)
    #send_file @file, :type=>@job_user.resume_content_type, :x_sendfile=>true, :disposition => 'attachment'
    #redirect_to root_path,notice: (@job_users)
  end
  def rejected
    JobApply.where(user_id: params[:user],job_id: params[:jobid]).update(rejected: 1)
    redirect_to job_applies_path(jobid: params[:jobid])
  end
  def new
    create
  end
  def create
    @job=Job.find(params[:jobid])
    @job_apply=current_user.job_applies.create(job: @job,seen: 0)
    if @job_apply.save
      redirect_to root_path,notice: "Sucessfully Applied For Job"
    end
  end
  def show
    @users=User.all
  end
  def job_seeker
    @job_user=User.find(params[:user])
    @education_details=EducationDetail.where(user_id: @job_user)
    @experiences=Experience.where(user_id: @job_user)
    JobApply.where(user_id: params[:user],job_id: params[:jobid]).update(seen: 1)
  end
end
