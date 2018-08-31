require 'rails_helper'

describe 'GET /organizations', type: :request do
  context 'without filters' do
    let!(:organizations) { FactoryGirl.create_list(:organization, 10) }

    before { get '/organizations' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all organizations' do
      body = JSON.parse(response.body)
      expect(body.size).to eq(10)
    end
  end

  context 'filtering' do
    let(:org1) do
      FactoryGirl.create(:organization,
        name: "org1", city: "city1", state: "A1", postal: "99991", category: "Category 1")
    end

    let(:org2) do
      FactoryGirl.create(:organization,
        name: "org2", city: "city2", state: "A2", postal: "99992", category: "Category 2")
    end

    let!(:organizations) { org1; org2 }

    describe 'by filter' do
      it 'returns all matching organizations' do
        %w(name city state postal category).each do |filter|
          get "/organizations?#{filter}=#{org1.send(filter.to_sym)}"
          expect(response.body).to eq [org1].to_json
        end
      end
    end

    describe 'ordering by attribute' do
      it 'returns results in the requested order' do
        %w(name city state postal category).each do |filter|
          get "/organizations?orderby=#{filter}"

          body = JSON.parse(response.body)
          expect(body[0][filter] < body[1][filter]).to be_truthy
        end
      end
    end

    describe 'ordering in a direction' do
      it 'returns results in the desired order' do
        %w(name city state postal category).each do |filter|
          [ %w(ASC <), %w(DSC >) ].each do |direction, operator|
            get "/organizations?orderby=#{filter}&direction=#{direction}"

            body = JSON.parse(response.body)
            first = body[0][filter]
            second = body[1][filter]
            expect(first.send(operator, second)).to be_truthy
          end
        end
      end
    end
  end
end