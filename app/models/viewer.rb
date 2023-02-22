class Viewer < ApplicationRecord
    has_secure_password
    has_many :visits
    has_many :arts, through: :visits
    has_many :galleries
    has_many :arts, through: :galleries
    has_many :reviews

    validates :email, presence: true, uniqueness: true, 
    format: { with: URI::MailTo::EMAIL_REGEXP }
    PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) #at least 8 characters long
    (?=.*\d) #contains at lease one digit
    (?=.*[a-z]) #contains at least one lowercase letter
    (?=.*[A-Z]) #contains at least one uppercase letter
    (?=.*[[:^alnum:]]) #contains at least one symbol
    /x
    validates :password, presence: true, format: PASSWORD_REQUIREMENTS

    
end
