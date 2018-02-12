class Interview < ApplicationRecord
  belongs_to :user

  enum state: { pending: 0, approval: 1 }

  def formated_datetime
    self.interview_datetime.strftime("%Y/%m/%d  %H:%M:%S")
  end
end
