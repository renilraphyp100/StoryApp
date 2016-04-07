class Story < ActiveRecord::Base
    belongs_to :author
    
    validates :title, presence: true, length: { minimum: 5 }    
    validates :content, presence: true, length: { minimum: 10 } 
    
    mount_uploader :picture, AvatarUploader
end
