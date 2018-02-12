class InterviewcreatedMailer < ApplicationMailer
  def send_when_create(user)
    @user = user
    mail to: @user.email,
         subject: '日程が追加されました。'
  end
end
