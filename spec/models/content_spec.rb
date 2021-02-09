# spec/models/item_spec.rb
require 'rails_helper'

# Test suite for the content model
RSpec.describe Content, type: :model do
  # Association test
  # ensure an Content record belongs to a single Project record
  it { should belong_to(:project) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end