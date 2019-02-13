class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render new_cocktail_path
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def update
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end
end
