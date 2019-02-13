class DosesController < ApplicationController
  def index
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def params_dose
    params.require(:dose).permit(:description)
  end
end
