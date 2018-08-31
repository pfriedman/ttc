require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:postal_code, :category) }
  end
end
