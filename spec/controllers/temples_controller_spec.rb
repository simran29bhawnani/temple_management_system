require 'rails_helper'

describe TemplesController, type: :request do
  
  describe 'create' do
    let(:params) { { temple: {  temple_name: 'Annapurna', description: 'Prominent temple dedicated to the Hindu goddess of...', temple_email: 'annapurna@mailinator.com', phone_no: '0194 231 3146', temple_address: '23, Annapurna Rd, Annapurna Mandir, Kranti Kriplan...', city: 'Indore', state: 'Madhya Pradesh', country: 'India', zipcode: 452009, start_time: '2021-10-25 10:00:00', end_time: '2021-10-25 12:00:00', created_at: '2021-10-25 07:10:10', updated_at: '2021-11-02 06:49:35'}}}
    
    it 'create temple successfully' do
      expect {
        post '/temples', params: params
      }.to change { Temple.count }.by(1)

      expect(params[:temple][:temple_name]).to eq('Annapurna')
    end
  end

  describe 'update' do
    let(:temple) {create(temple_name: 'Annapurna', description: 'Prominent temple dedicated to the Hindu goddess of...', temple_email: 'annapurna@mailinator.com', phone_no: '0194 231 3146', temple_address: '23, Annapurna Rd, Annapurna Mandir, Kranti Kriplan...', city: 'Indore', state: 'Madhya Pradesh', country: 'India', zipcode: 452009, start_time: '2021-10-25 10:00:00', end_time: '2021-10-25 12:00:00', created_at: '2021-10-25 07:10:10', updated_at: '2021-11-02 06:49:35')}
    let(:params) { { temple: { city: 'Guna'} } }

    it 'update successfully' do
      expect {
        put "/temples/#{temple.id}", params: params
        expect(temple.city).to eq('Guna')
        expect(temple.temple_name).to eq('Annapurna')
      }
    end
  end

  describe 'delete' do
    let(:temple) {create(temple_name: 'Annapurna', description: 'Prominent temple dedicated to the Hindu goddess of...', temple_email: 'annapurna@mailinator.com', phone_no: '0194 231 3146', temple_address: '23, Annapurna Rd, Annapurna Mandir, Kranti Kriplan...', city: 'Indore', state: 'Madhya Pradesh', country: 'India', zipcode: 452009, start_time: '2021-10-25 10:00:00', end_time: '2021-10-25 12:00:00', created_at: '2021-10-25 07:10:10', updated_at: '2021-11-02 06:49:35')}

    it 'delete temple successfully' do
      expect {
        delete "/temples/#{temple.id}", params: params
      }
      expect(Temple.count).to eq(0)
    end
  end
end
