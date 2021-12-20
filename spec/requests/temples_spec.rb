require "swagger_helper"
RSpec.describe "temples_controller", type: :request do
  path "/temples" do
    post "Create a Temple" do
      tags "Temples"
      consumes "application/json"
      
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          temple_name: { type: :string },
          description: { type: :string },
          temple_email: { type: :string },
          phone_no: { type: :string },
          temple_address: { type: :string },
          city: { type: :string },
          state: { type: :string },
          country: { type: :string },
          zipcode: { type: :integer },
          start_time: { type: :datetime },
          end_time: { type: :datetime }
        },
        required: ["temple_name"],
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
  
  path "/temples/{id}" do
    put "Update existing temple with form data" do
      tags "Temples"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :string
      parameter name: :temple, in: :body, schema: {
        type: :object,
        properties: {
          temple_name: { type: :string },
          description: { type: :string },
          temple_email: { type: :string },
          phone_no: { type: :string },
          temple_address: { type: :string },
          city: { type: :string },
          state: { type: :string },
          country: { type: :string },
          zipcode: { type: :integer },
          start_time: { type: :datetime },
          end_time: { type: :datetime }
        },
        required: ["id"],
      }

      response '200', 'Temple found' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
        # response "201", "temple updated" do
        #   let(:temple) { { temple_name: "Shiv Temple", description: "Lord Shiv"} }
        #   run_test!
        # end
        # response "422", "invalid request" do
        #   let(:temple) { { description: "Lord Shiv" } }
        #   run_test!
        # end
    end
  end

  path "/temples/{id}" do
    get "Show Temple" do
      tags "Temples"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Temple found' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end

  path "/temples/{id}" do
    delete "Delete Temple" do
      tags "Temples"
      consumes "application/json"
      produces 'application/json', 'application/xml'

      parameter name: :id, in: :path, type: :integer

      response '200', 'Temple destroy' do
        schema type: :object,
          properties: {
            id: { type: :integer }
          },
          required: [ 'id' ]
      end
      response "422", "invalid request" do
        let(:temple) { { description: "Lord Shiv" } }
        run_test!
      end
    end
  end
end
