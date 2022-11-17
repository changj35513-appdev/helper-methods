class DirectorsController < ApplicationController

  def index
    @directors = Director.order(name: :asc)
  end

  def new
    @director = Director.new
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to(directors_url, notice: "Director created successfully.")
    else
      render "new"
    end

  end

  def show
    @director = Director.find(params.fetch(:id))
  end
  
  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    @director = Director.find(params.fetch(:id))

    if @director.valid?
      @director.update(director_attributes)
      redirect_to(director_url(@director), notice: "Director updated successfully.")
    else
      redirect_to(director_url(@director), alert: "Director did not update correctly.")
    end


  end


  def destroy
    @director = Director.find(params.fetch(:id))
    @director.destroy
    redirect_to(directors_url, notice: "Director deleted successfully.")
  end















  
end