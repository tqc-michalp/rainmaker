# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users', type: :request do
  context 'response as a XLS' do
    let(:users) { create_list(:user, 4) }
    let(:request) { get users_path(format: :xls) }

    it 'has proper status' do
      users
      request
      expect(response).to have_http_status(:ok)
    end
  end
end
