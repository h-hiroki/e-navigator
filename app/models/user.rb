class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: { male: 0, female: 1 }
  has_many :interview

  def calc_birthday
    if self.birthday != nil
      (Date.today.strftime('%Y%m%d').to_i - self.birthday.strftime('%Y%m%d').to_i )/ 10000
    else
      ""
    end
  end

end
