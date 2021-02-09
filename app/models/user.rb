class User < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_many :projects, foreign_key: :user_id
    
    # Validations
    validates_presence_of :firstName, :lastName, :email, :password
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
