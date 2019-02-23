require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:photo) }
    it { is_expected.to validate_presence_of(:votes) }
    it { is_expected.to validate_presence_of(:total_score) }
  end
  describe "Relationships" do
    it { is_expected.to belong_to(:breed) }
  end
end
