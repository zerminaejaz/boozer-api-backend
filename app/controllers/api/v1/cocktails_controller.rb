module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        render json: Cocktail.find(params[:id])
      end

      def create
        cocktail = Cocktail.create(name: cocktail_params[:name])

        cocktail_params[:proportions].each do |proportion|
           ingredient = Ingredient.find_or_create_by(name: proportion[:ingredient_name])
           proportion = Proportion.create(amount: proportion[:amount], ingredient: ingredient, cocktail: cocktail)
        end
      end

      def edit

      end

      def update

      end

      def destroy

      end

      private

      def cocktail_params
        params.require(:cocktail).permit(:name, :description, :instructions,  proportions: [:ingredient_name, :amount])
      end
    end
  end
end
