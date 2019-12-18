class AttractionsController < ApplicationController
   def index
    @attractions = Attraction.all
   end

   def new
   @attraction = Attraction.new
   end

   
   def show
     #binding.pry
      @attraction = Attraction.find_by(id: params[:id])
      @ride = @attraction.rides.build(user_id: current_user.id)
     
   end

   def create
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
   end

   def edit
      @attraction = Attraction.find_by(id: params[:id])
   end

   def attraction_params
      params.require(:attraction).permit(
      :name,
      :min_height,
      :happiness_rating,
      :nausea_rating,
      :admin,
      :tickets
      )
  end

  def update
   @attraction.update(attraction_params)
  end


end
