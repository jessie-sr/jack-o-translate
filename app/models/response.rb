# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
