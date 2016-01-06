class PrivateMessage < ActiveRecord::Base

	belongs_to :user,  dependent: :delete
	belongs_to :post 

end
