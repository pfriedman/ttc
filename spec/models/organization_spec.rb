require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:organization)).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:postal, :category) }
  end
end
