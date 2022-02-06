#model Author
class Author < ApplicationRecord
  has_many :author_books, :dependent => :destroy
  has_many :books, through: :author_books
  belongs_to :user

  validates :firstname, :lastname, :birthdate, presence: true
  validate :birth_date_cannot_be_in_the_future

  def birth_date_cannot_be_in_the_future
    if birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, "can't be in the future")
    end
  end 

  def full_name
    "#{self.firstname} #{self.lastname}"    	
  end 

  def display_birthdate
     self.birthdate.strftime("%d/%m/%Y")
   end 
end
