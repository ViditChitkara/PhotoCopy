class Product < ActiveRecord::Base
  belongs_to :admin
  has_many :reviews
  has_many :users , through: :reviews

  def all_reviews
  	self.reviews.all
  end

  def user_list
  	self.users.all
  end

  def product_and_reviews
  	product = Hash.new
    product[:product] = self
    product[:reviews] = self.all_reviews
    product
  end

end
