class SignupListsController < ApplicationController
  before_action { set_navbar("hacktivists") }

  def index
    @signup_list = SignupList.new
    @count = SignupList.count
  end

  def create
    @signup_list = SignupList.new(signup_list_params)

    if @signup_list.save
      SignupMailer.welcome_email(@signup_list).deliver_later
      render :json => { count: SignupList.count, message: "Thank you for joining, #{@signup_list.name}." }
    else
      render :json => { error_message: @signup_list.errors.full_messages.join(". ").concat(".") }
    end
  end

  private
  def signup_list_params
    params.require(:signup_list).permit(:name, :email)
  end
end
