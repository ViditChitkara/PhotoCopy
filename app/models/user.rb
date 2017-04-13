class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable,:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :products , through: :reviews

  after_create :generate_access_token


  def generate_access_token
    generated = SecureRandom.hex
    until User.where(access_token: generated).first.nil?
      generated = SecureRandom.hex
    end
    self.access_token = generated
    save!
  end

  def products_reviewed
    self.products.all
  end
  
end
