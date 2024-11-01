require 'rails_helper'

RSpec.describe 'Emails', type: :request do
  describe 'GET /index' do
    let!(:email) do
      Email.create(to: 'test', content: 'this is a test')
    end

    it 'List all emails' do
      get '/emails'
      expect(JSON.parse(response.body)).to eq([email.as_json])
    end
  end

  describe 'POST /create' do
    it 'Create a new email' do
      expect do
        post '/email', params: { email: { to: 'test', content: 'new test email' } }
      end.to change(Email, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include(
        'to' => 'test',
        'content' => 'new test email'
      )
    end
  end
end
