class ExperiencesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    before_action :set_business
  def new
    @experience = Experience.new(business: @business)
  end

  def create
      @experience = current_user.experiences.build(experience_params)
      @experience.business = @business
    if @experience.save
    #@experience.save
    #redirect_to @business
      flash[:success] = "Experience created!"
      redirect_to @business
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def experience_params
      params.require(:experience).permit(:comment, :picture)
    end
    
    def set_business
    @business = Business.find(params[:business_id])
  end
    
    def correct_user
      @experience = current_user.experiences.find_by(id: params[:id])
      redirect_to root_url if @experience.nil?
    end
end
