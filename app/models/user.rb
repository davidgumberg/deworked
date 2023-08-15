class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :possessions, inverse_of: :user, dependent: :delete_all
  has_many :works, through: :possessions

  def has_work?(work)
    self.possessions.find_by(work: work)
  end

end
