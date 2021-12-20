require "swagger_helper"
RSpec.describe "offline_city_centres_controller", type: :request do
  path "/offline_city_centres" do
    post "Create a Offline City Centre" do
      tags "Offline City Centre"
      consumes "application/json"
      
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          city: { type: :string },
          state: { type: :string },
          pincode: { type: :integer },
          mail_id: { type: :string },
          phone_no: { type: :string },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }
      response "201", "temple created" do
        let(:temple) { { temple_name: "Shiv Temple", description: "Lord Shiv"} }
        run_test!
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end
  
  path "/offline_city_centres/{id}" do
    put "Update existing offline city centre" do
      tags "Offline City Centre"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          city: { type: :string },
          state: { type: :string },
          pincode: { type: :integer },
          mail_id: { type: :string },
          phone_no: { type: :string },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }

      response '200', 'Offline City Centres found' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'temple_id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end

  path "/offline_city_centres/{id}" do
    get "Show Offline City Centre" do
      tags "Offline City Centre"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Offline City Centres found' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'temple_id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end

  path "/offline_city_centres/{id}" do
    delete "Delete Offline City Centre" do
      tags "Offline City Centre"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Temple destroy' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'temple_id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end
end
