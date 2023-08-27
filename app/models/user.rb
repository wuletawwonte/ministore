# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:microsoft_office365]

  has_many :inventory_items

  def self.find_for_oauth(provider_data)
    user = User.where(provider: provider_data.provider, uid: provider_data.uid).first

    user ||= User.create(
      uid: provider_data.uid,
      provider: provider_data.provider,
      email: provider_data.info.email,
      password: Devise.friendly_token[0, 20]
    )

    user
  end
end
