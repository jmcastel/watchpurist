class PrivateMessage < ActiveRecord::Base

	belongs_to :user,  dependent: :destroy
	belongs_to :post 

end
