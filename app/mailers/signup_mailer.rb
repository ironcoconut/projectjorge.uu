class SignupMailer < ApplicationMailer
  def welcome_email(signup)
    @signup = signup
    mail(to: @signup.email, subject: "Welcome to the UU Hacktivists, #{@signup.name}!")
  end
end
