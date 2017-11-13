class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:saml]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.info.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.saml_data"] && session["devise.saml_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
