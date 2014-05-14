class Cic < ActiveRecord::Base
  validates :presidency, :state, :took_office, :left_office, :party, :image, presence: true 
  validates :biography, presence: true 
  validates :term, numericality: {greater_than_or_equal_to: 1}
  validates :president, uniqueness: true	
  validates :image, allow_blank: true, format: {
        with:  %r{\.(gif|jpg|png)\Z}i,
  	message: 'must be a URL for GIF, JPG or PNG image.'
		}   
end
