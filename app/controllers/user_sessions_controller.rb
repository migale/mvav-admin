class UserSessionsController < ApplicationController
   before_filter :require_no_user, :only => [:new, :create]
	 before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Connecté."
      redirect_to root_url
    else
      render :action => ‘new’
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Déconnecté."
    redirect_to root_url
  end

end