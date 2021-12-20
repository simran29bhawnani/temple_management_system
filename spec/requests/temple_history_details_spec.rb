require "swagger_helper"
RSpec.describe "temple_history_details_controller", type: :request do
  path "/temple_history_details" do
    post "Create a temple history details" do
      tags "Temple History Details"
      consumes "application/json"
      
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          temple_history: { type: :string },
          temple_structure: { type: :string },
          inside_temple_theertham: { type: :string },
          outside_temple_theertham: { type: :string },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }
      response "201", "temple history details" do
        let(:temple) { { temple_name: "Shiv Temple", description: "Lord Shiv"} }
        run_test!
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end
  
  path "/temple_history_details/{id}" do
    put "Update existing temple histroy details" do
      tags "Temple History Details"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          temple_history: { type: :string },
          temple_structure: { type: :string },
          inside_temple_theertham: { type: :string },
          outside_temple_theertham: { type: :string },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }

      response '200', 'Temple History Details found' do
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

  path "/temple_history_details/{id}" do
    get "Show Temple History Details" do
      tags "Temple History Details"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Temple History Details found' do
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

  path "/temple_history_details/{id}" do
    delete "Delete Temple Histroy Details" do
      tags "Temple History Details"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Temple History Details destroy' do
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
