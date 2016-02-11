class Post < ActiveRecord::Base

	searchkick word_start: [:title, :brand, :model]

	extend FriendlyId
    friendly_id :brand_and_model, use: [:slugged, :history]

	is_impressionable

	belongs_to :user 
	has_many :private_messages , dependent: :destroy
	has_many :users, through: :private_messages

	has_attached_file :image, styles:  { original: {convert_options: '-auto-orient'}, large: "1024x1024>", medium: "300x300>", thumb: "100x100>" }
	has_attached_file :image2, styles: { original: {convert_options: '-auto-orient'}, large: "1024x1024>", medium: "300x300>", thumb: "100x100>" }
	has_attached_file :image3, styles: { original: {convert_options: '-auto-orient'}, large: "1024x1024>", medium: "300x300>", thumb: "100x100>" }

	validates_attachment_content_type :image,  content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/

	attr_accessor :remove_image
	attr_accessor :remove_image2
	attr_accessor :remove_image3

	before_save :delete_image, if: ->{ remove_image == '1' && !image_updated_at_changed? }
	before_save :delete_image2, if: ->{ remove_image2 == '1' && !image2_updated_at_changed? }
	before_save :delete_image3, if: ->{ remove_image3 == '1' && !image3_updated_at_changed? }

  	private
		def delete_image
			self.image = nil
		end

		def delete_image2
			self.image2 = nil
		end

		def delete_image3
			self.image3 = nil
		end

		def brand_and_model
    		["#{brand}  #{model} #{condition}",
    			["#{brand}  #{model} #{condition} from #{year}"],
    			["#{brand}  #{model} #{condition} from #{year}  #{price}"  ],
    			["#{brand}  #{model} #{condition} from #{year}  #{price} #{currency}"],
    			["#{brand}  #{model} #{condition} from #{year}  #{price} #{currency} #{dial}"]
    		]
  		end

  		def should_generate_new_friendly_id?
    		brand_changed? || model_changed? || super
  		end




	#monetize :price

	validates :title, :brand, :model, :price, :currency, :year, :condition, presence: true
	validates :image, presence: true


	

end
