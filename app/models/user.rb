# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :translations, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_one_attached :profile_image

  before_save :set_username

  def self.from_omniauth(auth)
    user = User.find_or_create_by(email: auth.info.email) do |u|
      u.password = Devise.friendly_token[0, 20]
      # Add other attributes as needed, such as u.name
    end

    unless user.confirmed?
      user.skip_confirmation!
      user.save!
    end
    user
  end

  private

  def set_username
    self.username = email if username.blank?
  end
end
