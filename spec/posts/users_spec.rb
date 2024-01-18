# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    before do
      @user = FactoryBot.create(:user) # Or create a user directly
      sign_in @user
    end

    it 'returns http success' do
      get user_path(@user)
      expect(response).to have_http_status(:success)
    end
  end
end
