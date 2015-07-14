class UserMailer < ActionMailer::Base
  default from: "from@example.com"


  def send_project_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for visiting our site!' )
  end
end
