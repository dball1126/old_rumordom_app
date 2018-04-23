class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @micropost = current_user.microposts.build
    @experience = current_user.experiences.build 
    @feed_items = current_user.feed.paginate(page: params[:page])
    @feedz_items = current_user.feedz.paginate(page: params[:page])
   # respond_to do |format|
    #  format.html { redirect_to @user }
     # format.js
    
    
    end
  end
  
  def help
  end

  def about
  end
end