class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post , dependent: :destroy
  has_many :notifications, as: :notifiable, foreign_key: :recipient_id

  has_attached_file :avatar, styles:  { original: {convert_options: '-auto-orient'}, large: "1024x1024>", medium: "300x300>", thumb: "100x100>" }, default_url: '/images/thumbs/missing.png'
  
  validates_attachment_content_type :avatar,  content_type: /\Aimage\/.*\Z/
  
  attr_accessor :remove_avatar
  
  before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }

  validates :pseudo, presence: true

  private
  	def delete_avatar
  		self.avatar = nil
  	end

end
