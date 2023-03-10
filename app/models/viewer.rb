class Viewer < ApplicationRecord
    has_secure_password

    
    has_many :galleries, dependent: :destroy
    has_many :arts, through: :galleries

    # has_many :visits, dependent: :destroy
    # has_many :arts, through: :visits

    # has_many :likes, dependent: :destroy



    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true, length: { in: 2..12 }
    validates :last_name, presence: true, length: { in: 2..25 }
    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) #at least 8 characters long
        (?=.*\d) #contains at lease one digit
        (?=.*[a-z]) #contains at least one lowercase letter
        (?=.*[A-Z]) #contains at least one uppercase letter
        (?=.*[[:^alnum:]]) #contains at least one symbol
        /x
    validates :password, presence: true, on: create, format: PASSWORD_REQUIREMENTS  
    validates :zip_code, presence: true
    
end
