require "swagger_helper"
RSpec.describe "offline_city_centres_controller", type: :request do
  path "/devoters" do
    post "Create a devoter" do
      tags "Devoter"
      consumes "application/json"
      
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          address: { type: :string },
          zipcode: { type: :integer },
          mail_id: { type: :string },
          contact: { type: :string },
          id_proof: { type: :string },
          proof_id_number: { type: :string },
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
  
  path "/devoters/{id}" do
    put "Update existing devoter" do
      tags "Devoter"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          address: { type: :string },
          zipcode: { type: :integer },
          mail_id: { type: :string },
          contact: { type: :string },
          id_proof: { type: :string },
          proof_id_number: { type: :string },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }

      response '200', 'Devoter found' do
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

  path "/devoters/{id}" do
    get "Show devoter" do
      tags "Devoter"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Devoter found' do
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

  path "/devoters/{id}" do
    delete "Delete Devoter" do
      tags "Devoter"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Devoter destroy' do
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
