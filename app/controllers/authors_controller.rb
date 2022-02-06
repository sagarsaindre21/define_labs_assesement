#AuthorsController
class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
   @collection = Author.where(user_id: current_user.id)
  end

  def new
    @author = Author.new
  end

  def show
    @books = Book.author_books(@author.id)

    if api_request?
       render json: {author: @author, books: @books}
    end

  end

  def edit; end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_path(@author), notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @author = current_user.authors.build(author_params)
    respond_to do |format|
      if @author.save
        format.html { redirect_to author_path(@author), notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit!
  end

  def api_request?
    request.format.json? || request.format.xml?
  end
end
