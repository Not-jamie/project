class AthletesController < ApplicationController

# GET /athletes
  # GET /athletes_data.txt
  def index
  @athletes = Athlete.all
  end
    # POST /athletes
  # POST /athletes_data.txt
    def create
    @athlete = Athlete.new(athlete_params)
	respond_to do |format|
      if @athlete.save
        format.html { redirect_to @athlete, notice: 'Athlete was added successfully' }
        format.json { render action: 'show', status: :created, location: @athlete }
      else
        format.html { render action: 'new' }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
	end
end
