class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
    @user = user
    mail(to: @user.email, subject: 'There\'s been activity on your event!')
  end

end
