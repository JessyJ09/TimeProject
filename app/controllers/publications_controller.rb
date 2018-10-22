class PublicationsController < ApplicationController
  def index
	  @publications = Publication.all
	  @sujets = Subject.all
	  @categories = Category.all
  end
def show
	@publication = Publication.find(params[:id])
	@commentaires = @publication.commentaires
		
end

  def create
  end
  def new
	  @sujet = Subject.new params_subj
	  @category = Category.find(params[:category_id])
	  @sujet.category_id = @category.id

	  @sujet.save

	 @current_user = User.find(session[:user_id])

 @publication = Publication.new params_publi

 @publication.subject_id = @sujet.id

 @publication.user_id = @current_user.id 
 @publication.save
# byebug
 redirect_to "/publications/index"
 end
def params_publi
	params.require(:publication).permit(:title, :content, :subject_id, :user_id)
end
  def params_subj
	  params.require(:subject).permit(:name, :category_id)
end

def hier
	public(1)
end
def aujourdhui
	public(2)
end
def demain
	public(3)
end

def public(id)
	@category = Category.find(id)
	@publications = []
	@sujets = @category.subjects
	@sujets.each do |sujet|
		@publications += Publication.where(subject_id: sujet.id)
		
#byebug
	end
	
end
end
