class JokesController < ApplicationController
  before_action :set_joke, only: [:show, :edit, :destroy, :update] 

  def index
    @jokes = Joke.all
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      flash[:notice]= "The joke Was Succesfully Created"
      redirect_to joke_path(@joke)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @joke.update(joke_params)
      flash[:notice]= "Hopefully this joke is funnier now"
      redirect_to joke_path(@joke)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @joke.destroy
    flash[:notice]= "the Article was deleted asshole!!!!"
    redirect_to jokes_path


  end

  private

  def joke_params
    params.require(:joke).permit(:title, :description)
  end

  def set_joke
    @joke = Joke.find(params[:id])
  end


end
