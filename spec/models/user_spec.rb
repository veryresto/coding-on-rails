# spec/models/user_spec.rb
require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the project model
  it { should have_many(:projects) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:firstName) }
  it { should validate_presence_of(:lastName) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end