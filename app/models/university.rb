class University < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many   :reviews

	 has_attached_file :uni_image, styles: { uni_index: "250x350>", uni_show: "325x475>" }, default_url: "/images/:style/missing.png"
     validates_attachment_content_type :uni_image, content_type: /\Aimage\/.*\z/
end
