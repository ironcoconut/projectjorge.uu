class SignupListsController < ApplicationController

  def index
    @signup_list = SignupList.new
    @count = SignupList.count
  end

  def create
    @signup_list = SignupList.new(signup_list_params)

    if @signup_list.save
      redirect_to signup_lists_path, notice: 'Welcome to the mailing list!'
    else
      render :index
    end
  end

  private
  def signup_list_params
    params.require(:signup_list).permit(:name, :email)
  end
end
