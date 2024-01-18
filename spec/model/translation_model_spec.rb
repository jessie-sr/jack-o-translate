# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Translation, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'is valid with valid attributes' do
    translation = described_class.new(
      input_text: '你好',
      language: 'English',
      tone: 'friendly',
      context: 'greeting',
      user: @user # Associate the user here
    )
    expect(translation).to be_valid
  end

  it 'is not valid without input_text' do
    translation = described_class.new(
      language: 'English',
      tone: 'friendly',
      context: 'greeting',
      user: @user # Associate the user here
    )
    expect(translation).not_to be_valid
  end
end