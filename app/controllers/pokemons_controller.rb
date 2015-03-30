class PokemonsController < ApplicationController

	def capture
	@pokemon1 = Pokemon.find(params[:id])
    @pokemon1.update_attribute(:trainer_id, current_trainer.id)
    @pokemon1.save
    redirect_to root_path
	end 

	def damage
		@pokemon1 = Pokemon.find(params[:id])
		if @pokemon1.health > 10 
			@pokemon1.update_attribute(:health, @pokemon1.health - 10)
			@pokemon1.save
		else
			@pokemon1.delete
		end
		redirect_to trainer_path(id: current_trainer.id)
	end

	def create
		@new_pokemon = Pokemon.new 
		@new_pokemon.name = params[:pokemon]['name']
		@new_pokemon.level = 1
		@new_pokemon.health = 100
		@new_pokemon.trainer_id = current_trainer.id
		if @new_pokemon.save
			redirect_to trainer_path(id: current_trainer.id)
		else 
			flash[:error] = @new_pokemon.errors.full_messages.to_sentence
			redirect_to pokemon_new_path
		end
	end

	def new 
	end 
end