# spec/models/project_spec.rb
require 'rails_helper'

# Test suite for the project model
RSpec.describe Project, type: :model do
  # Association test
  # ensure Project model has a 1:m relationship with the Content model
  it { should have_many(:contents).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:projectType) }
  it { should validate_presence_of(:thumbnail) }
end