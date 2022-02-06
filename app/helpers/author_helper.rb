#module AuthorHelper
module AuthorHelper
	def authors_list
		Author.where(user_id: current_user.id).map { |s| [s.full_name, s.id] }
	end
end
