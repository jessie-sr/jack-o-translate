# frozen_string_literal: true

class Translation < ApplicationRecord
  validates :input_text, presence: true
  validates :language, presence: true
  validates :tone, presence: true
  validates :context, presence: true

  validates :output_text, length: { maximum: 2000 }

  belongs_to :user
end
