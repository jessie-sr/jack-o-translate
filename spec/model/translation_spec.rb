require 'rails_helper'

RSpec.describe Translation, type: :model do
  it "is valid with valid attributes" do
    translation = Translation.new(input_text: "Hello", tone: "friendly", context: "greeting")
    expect(translation).to be_valid
  end

  it "is not valid without input_text" do
    translation = Translation.new(tone: "friendly", context: "greeting")
    expect(translation).not_to be_valid
  end
end