require 'rails_helper'

describe 'WorshipsController', type: :request do
  
    # temple = Temple.create(temple_name: "Annapurna", description: "Prominent temple dedicated to the Hindu goddess of...", temple_email: "annapurna@mailinator.com", phone_no: "0194 231 3146", temple_address: "23, Annapurna Rd, Annapurna Mandir, Kranti Kriplan...", city: "Indore", state: "Madhya Pradesh", country: "India", zipcode: 452009, start_time: "2021-10-25 10:00:00", end_time: "2021-10-25 12:00:00")
    # let(:valid_attributes) do
    #   {
    #     name: "Suprabhatam",
    #     type_of_pooja: "Daily Sevas",
    #     pundit: "Ramkumar Swami Reddy",
    #     status: nil,
    #     start_time: "2021-11-12 05:30:00", 
    #     end_time: "2021-11-12 07:00:00", 
    #     temple_id: temple.id
    #   }
    # end

    # context 'with valid parameters' do
    #   it 'creates a new Worship' do
    #     expect do
    #       worship = Worship.new(valid_attributes)
    #       worship.save
    #       post worships_url, params: { worship: valid_attributes }
    #     end.to change(Worship, :count).by(1)
    #   end
    # end

    # describe 'create' do
    #   let(:params) { { worship: { name: "Suprabhatam",
    #   type_of_pooja: "Daily Sevas",
    #   pundit: "Ramkumar Swami Reddy",
    #   status: nil,
    #   start_time: "2021-11-12 05:30:00", 
    #   end_time: "2021-11-12 07:00:00", 
    #   temple_id: temple.id} } }
  
    #   it 'creates job successfully with log attachment' do
    #     expect {
    #       post '/worships', params: params
    #     }.to change { Worship.count }.by(1)
  
    #     # expect(Job.last.logo.attached?).to be true
    #   end
    # end

    let(:content) { 'foobar' }
    let(:user) do
      User.create(
        email: 'foo@bar.net',
        password: 'chicken',
        password_confirmation: 'chicken'
      )
    end
    let(:blog) do
      Blog.create(
        user_id: user.id,
        content: content
      )
    end
end
