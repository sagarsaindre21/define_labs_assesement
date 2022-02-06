#model Book
class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  belongs_to :user

  validates :title, presence: true

  def save_author_books(author_ids)
    author_ids&.each do |author_id|
      self.author_books.find_or_create_by(author_id: author_id)
    end
  end

  def self.author_books(author_id)
    self.left_joins(:author_books)
       .where('author_books.author_id = ?', author_id).uniq
  end

  def authors_name
    self.authors.map(&:full_name).join(', ')
  end
end
