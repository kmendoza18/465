class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @game = @pet.games.new

    temp = (((Time.now) - @pet.newtime)/1.hour).ceil
    
    @pet.newtime = Time.now

    if Time.now > (Time.parse "8:00 am")
        if Time.now < (Time.parse "8:00 pm")
            @pet.asleep = false
            @pet.clean -= (temp * 10)
            @pet.mood -= (temp * 10) 
        else
            @pet.asleep = true
        end
    else
        @pet.asleep = true
    end

    
    if @pet.asleep == false
    end

    @pet.health = (@pet.clean + @pet.mood)/2
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @pet.games.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.health = 100
    @pet.clean = 100
    @pet.mood = 100
    @pet.status = false # not sick
    @pet.age = Time.now
    @pet.newtime = Time.now
    @pet.money = 50
    @pet.user = current_user
    @pet.user_id = current_user.id
    @pet.cost = 0

    if Time.now > (Time.parse "8:00 am")
        if Time.now < (Time.parse "8:00 pm")
            @pet.asleep = false
        else
            @pet.asleep = true
        end
    else
        @pet.asleep = true
    end

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def self.decrement
    @pet.health -= 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :sex, :health, :clean, :mood, :status, :asleep, :age, :money, :user, :newtime, :user_id, :cost, :highscore_id, :user_id, games_attributes: [:money])
    end
end
