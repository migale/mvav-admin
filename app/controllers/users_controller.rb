class UsersController < ApplicationController    
  before_filter :require_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Utilisateur créé avec succès."
      redirect_to @user
    else
      render :action => ‘new’
    end
  end

  def edit
    @user = User.find(params[:id])
  end

 def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
     flash[:notice] = "Utilisateur mis à jour avec succès."
      redirect_to @user
    else
      render :action => ‘edit’
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Utilisateur détruit avec succès."
    redirect_to users_url
  end

end