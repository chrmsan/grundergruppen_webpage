class Member < ApplicationRecord
	
	validates :name, presence: true

	validates :image, presence: true

	has_attached_file :image, :styles => { :thumb => "100x100#" }, :convert_options => { :thumb => "-quality 75 -strip" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end