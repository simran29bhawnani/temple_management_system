require "swagger_helper"
RSpec.describe "worships_controller", type: :request do
  path "/worships" do
    post "Create Worship" do
      tags "Worship"
      consumes "application/json"
      
      parameter name: :worship, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          type_of_pooja: { type: :string },
          pundit: { type: :string },
          status: { type: :integer },
          start_time: { type: :datetime },
          end_time: { type: :datetime },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }
      response "201", "worship created" do
        let(:temple) { { temple_name: "Shiv Temple", description: "Lord Shiv"} }
        run_test!
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end
  
  path "/worships/{id}" do
    put "Update worship" do
      tags "Worship"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string
      parameter name: :worship, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          type_of_pooja: { type: :string },
          pundit: { type: :string },
          status: { type: :integer },
          start_time: { type: :datetime },
          end_time: { type: :datetime },
          temple_id: { type: :integer }
        },
        required: ["temple_id"],
      }

      response '200', 'Worship found' do
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

  path "/worships/{id}" do
    get "Show Worship" do
      tags "Worship"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Worship found' do
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

  path "/worships/{id}" do
    delete "Delete Worship" do
      tags "Worship"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Worship destroy' do
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
