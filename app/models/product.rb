class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items

  validates :name, presence: {message: 'is required'}
  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'must be a number' }


def image_url
  'http://1.bp.blogspot.com/-Hn_1JBSNTWo/UETGU9qtCCI/AAAAAAAAPNw/0FnkZvEFDeA/s1600/tumblr_liymnbD1M01qc8ax1o1_500.jpg'
end

end
