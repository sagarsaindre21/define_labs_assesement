#model Author
class Author < ApplicationRecord
  has_many :author_books, :dependent => :destroy
  has_many :books, through: :author_books
  belongs_to :user

  validates :firstname, :lastname, :birthdate, presence: true

  def full_name
    "#{self.firstname} #{self.lastname}"    	
  end  
end
