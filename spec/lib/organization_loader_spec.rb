require 'rails_helper'

RSpec.describe OrganizationLoader do
  describe '.run' do

    before(:each) do
      expect(Organization.count).to eq 0
      OrganizationLoader.run
    end

    it 'populates the database with all the valid records from the csv' do
      expect(Organization.count).to eq 182
    end

    context 'populating the database with data from the csv' do
      it 'strips whitespace from name' do
        o = Organization.find(1)
        expect(o.name).to eq 'Michigan Science Center'
      end

      it 'normalizes name' do
        o = Organization.find(17)
        expect(o.name).to eq 'Emaculate Cleaning Institute'
      end

      it 'turns "NULL" to nil' do
        o = Organization.find(19)
        [:city, :state, :postal_code].each do |attribute|
          expect(o.send(attribute)).to be nil
        end
      end
    end
  end
end