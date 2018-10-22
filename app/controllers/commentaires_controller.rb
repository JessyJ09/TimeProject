class CommentairesController < ApplicationController
def new
	publication = Publication.find(params[:id])
	@commentaire = Commentaire.new params_comment
	@commentaire.user_id = session[:user_id]
	@commentaire.publication_id = publication.id
	@commentaire.save
	redirect_to "/publications/#{publication.id}" 
end
def destroy
	commentaire = Commentaire.find(params[:id])
	current_public = commentaire.publication.id
	commentaire.destroy
	redirect_to "/publications/#{current_public}"

end


private 

def params_comment

	params.require(:commentaire).permit(:content, :position)
end
end
