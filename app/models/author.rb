class Author < ActiveRecord::Base
    has_many :stories, dependent: :destroy
    
    accepts_nested_attributes_for :stories
    
    validates :name, presence: true, length: { minimum: 3 }    
    validates :bio, presence: true, length: { minimum: 5 }   
    
    mount_uploader :picture, AvatarUploader
    
end
