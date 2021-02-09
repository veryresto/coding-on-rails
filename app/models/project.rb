class Project < ApplicationRecord
  belongs_to :user

  # model association
  has_many :contents, dependent: :destroy

  # validations
  validates_presence_of :title, :location, :projectType, :thumbnail, :user_id
end
