class Content < ApplicationRecord
  belongs_to :project

  # validation
  validates_presence_of :title, :body
end
