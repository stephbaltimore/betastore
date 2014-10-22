class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :name, presence: {message: 'is required'}
  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'must be a number' }


def image_url
  image_array = ["http://1.bp.blogspot.com/-Hn_1JBSNTWo/UETGU9qtCCI/AAAAAAAAPNw/0FnkZvEFDeA/s1600/tumblr_liymnbD1M01qc8ax1o1_500.jpg", "http://dayoftheartist.files.wordpress.com/2014/05/lisa-frank.gif", "http://www.theluxuryspot.com/wp-content/uploads/2012/10/Lisa-Frank-princess-kitten.jpg"].sample
end

end
