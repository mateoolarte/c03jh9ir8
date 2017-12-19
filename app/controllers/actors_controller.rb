class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end
  
  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_path, notice: "Se creo el actor correctamente"
    else
      render :new  
    end  
  end

  private
    def actor_params
      params.require(:actor).permit(:name, :image_url, :birth_date, :birth_place, :bio, :alive, :death_date, :death_place)
    end
end
