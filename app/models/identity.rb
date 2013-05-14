class Identity < OmniAuth::Identity::Models::ActiveRecord
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and 
  # devise :recoverable, :rememberable, :trackable, :validatable, :omniauthable         

  #attr_accessible :email, :password, :password_confirmation
end