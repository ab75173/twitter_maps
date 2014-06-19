class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
    @user = user
    @favorite = user.favorites.last
    mail(to: @user.email, subject: 'You just subscribed to an event!')
  end

end
