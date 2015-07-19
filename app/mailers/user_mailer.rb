class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_project_email(project, user_email)
  	@user = user_email
  	@project = project
    mail( :to => @user,
    	:subject => 'Thanks for visiting our site!' )
  end
end
