# ankita
class EducationsController < ApplicationController
  def new
      @education=Education.new
    end
    def index
      @educations=Education.all
    end
    def create

      @educations=Education.new(educations_param)
      if @educations.save
        #UserMailer.welcome_mail(current_user).deliver
        redirect_to educations_url
      else
        render 'new'
      end
    end

    def edit

       @education = Education.find(params[:id])
    end
    def update
      @education = Education.find(params[:id])
      #@user=current_user
      if @education.update(educations_param)
        redirect_to educations_path
      else
        render "edit"
      end
    end
    def destroy

      @education=Education.find(params[:id])
      if @education.destroy
        redirect_to educations_url
      end
    end

    private
    def educations_param
      params.require(:education).permit(:qualification)
    end
end
