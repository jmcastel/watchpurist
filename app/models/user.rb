class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post , dependent: :destroy
  has_many :notifications, as: :notifiable, foreign_key: :recipient_id


  validates :pseudo, presence: true

end
