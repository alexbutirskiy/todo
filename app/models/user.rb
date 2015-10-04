class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :github]
  
  has_many :projects

  def self.from_omniauth(auth)

    user = where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = find_by(email: auth.info.email)
      unless user
        #byebug
        user = create(provider: auth.provider, uid: auth.uid, 
                      email: auth.info.email, password: Devise.friendly_token[0, 20])
      end
    end

    user

    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   byebug
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    # end
  end

end
