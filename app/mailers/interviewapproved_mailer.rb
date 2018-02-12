class InterviewapprovedMailer < ApplicationMailer
  def send_when_approve(sender, approved_user)
    @sender        = sender
    @approved_user = approved_user
    mail to: @approved_user.email,
         cc: @sender.email,
         subject: '日程が承認されました。'
  end
end



