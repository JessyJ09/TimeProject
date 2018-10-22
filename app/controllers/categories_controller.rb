class CategoriesController < ApplicationController

def create
end
def new 
	@category = Category.new 
	@category.category = params[:category]
	@category.save
	flash[:success]="Categorie ajouté"  
	redirect_to "/categories/create"

end
end
