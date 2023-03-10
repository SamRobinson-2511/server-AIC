class Gallery < ApplicationRecord
  belongs_to :viewer
  belongs_to :art
  

  # validates_presence_of :title, :description
  # # validates :title, uniqueness: true
  # validates :title, length: {maximum:12, message: 'Please create a title with no more than 12 characters'}
  # validates :description, length: {in: 5..100, message: 'Please create a description between 5 and 100 characters'}
  # # validates :image_url, inclusion: {in:['jpg', 'png'], message:'The file type must be jpg or png'}
  
end
