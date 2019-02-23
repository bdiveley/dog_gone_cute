require 'rails_helper'

RSpec.describe Breed, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
