class PasswordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @passwords = Password.all
  end
    
  def new
    @password = Password.new
  end
  
  def create
    @password = Password.new(password_params)
    if @password.save
      flash[:success] = "Password Details Saved"
      redirect_to password_path(@password)
    else
      render 'new'
    end
  end
  
  def show
    @password = Password.find(params[:id])
  end
  
  def edit
    @password = Password.find(params[:id])
  end

  def update
    @password = Password.find(params[:id])
    if @password.update(password_params)
      flash[:success] = "Password details updated"
      redirect_to passwords_path
    else
      render 'edit'
    end
  end

  def destroy
    @password = Password.find(params[:id])
    @password.destroy
    flash[:danger] = "Password Deleted"
    redirect_to passwords_path
  end
  
  
  
  private
  
  def password_params
    params.require(:password).permit(:name, :user_name, :password, :notes)
  end

  def require_same_user
    if current_user != @password.user and !current_user.admin?
      flash[:danger] = "You cannot Edit or delete this Password"
      redirect_to passwords_path
    end
  end
    
end