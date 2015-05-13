class CharType < ActiveRecord::Base
	
	# Associations
	belongs_to :user

	# Use uploader
	mount_uploader :avatar, AvatarUploader
end
