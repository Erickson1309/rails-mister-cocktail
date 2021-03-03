class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktails = Cocktail.new
  end

  def create
    @cocktails = Cocktail.new(cocktail_params)
    if @cocktails.save
      redirect_to cocktails_path(@cocktails)
    else
      render 'new'
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
