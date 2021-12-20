require 'rails_helper'

# describe BlacklistsController, type: :controller do
#   let(:employer) { create(:user, role: :employer) }
#   let(:candidate) { create(:user, role: :talent) }
#   let(:person) { create(:person, user: candidate) }

#   describe 'unsubscribe' do
#     context 'without blacklisted before' do
#       it 'creates blacklist successfully' do
#         expect {
#           get :unsubscribe, params: { person_id: person.id, user_id: employer.id }
#         }.to change { Blacklist.count }.from(0).to(1)
#       end
#     end

#     context 'with blacklisted before' do
#       before { create(:blacklist, user: employer, person: person) }

#       it 'does not create blacklist' do
#         expect {
#           get :unsubscribe, params: { person_id: person.id, user_id: employer.id }
#         }.not_to change { Blacklist.count }
#       end
#     end
#   end
# end


describe TempleHistoryDetailsController, type: :request do

  describe 'create' do
    let(:temple) { create(:temple) }
    let(:params) { { temple_history_detail: {  temple_history: "Lord Sri Venkateswara, also known as Srinivasa, Ba...", temple_structure: "Bharat, the land of spiritual bliss is strongly be...", inside_temple_theertham: "Besides the sacred Vaishnavite iconic temple of Lo...", outside_temple_theertham: "There are several teerthams in Tirumala, some of t...", temple_id: temple.id, created_at: "2021-10-25 10:14:09", updated_at: "2021-10-25 10:14:09"}}}
    
    it 'create temple successfully' do
      expect {
        post '/temple_history_details', params: params
      }.to change { TempleHistoryDetail.count }.from(0).to(1)

      expect(params[:temple_history_detail][:created_at]).to eq('2021-10-25 10:14:09')
    end
  end

  describe 'update' do
    let(:params) { { temple_history_detail: {  temple_history: "Lord Sri Venkateswara, also known as Srinivasa, Ba...", temple_structure: "Bharat, the land of spiritual bliss is strongly be...", inside_temple_theertham: "Besides the sacred Vaishnavite iconic temple of Lo...", outside_temple_theertham: "There are several teerthams in Tirumala, some of t...", temple_id: 6, created_at: "2021-10-25 10:14:09", updated_at: "2021-10-25 10:14:09"}}}
    
    let(:params) { { temple_history_detail: { temple_id: 7} } }

    it 'update temple histroy detail successfully' do
      expect {
        put "/temples/#{temple.id}", params: params
        expect(temple.temple_id).to eq(6)
      }
    end
  end

  describe 'delete' do
    let(:params) { { temple_history_detail: {  temple_history: "Lord Sri Venkateswara, also known as Srinivasa, Ba...", temple_structure: "Bharat, the land of spiritual bliss is strongly be...", inside_temple_theertham: "Besides the sacred Vaishnavite iconic temple of Lo...", outside_temple_theertham: "There are several teerthams in Tirumala, some of t...", temple_id: 6, created_at: "2021-10-25 10:14:09", updated_at: "2021-10-25 10:14:09"}}}

    it 'delete temple histroy detail successfully' do
      expect {
        delete "/temples/#{temple.id}", params: params
      }

      expect(TempleHistoryDetail.count).to eq(0)
    end
  end
end
