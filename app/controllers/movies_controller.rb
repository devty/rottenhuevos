require 'rottentomatoes'
require 'httparty'
require 'manpack'

class MoviesController < ApplicationController
  include RottenTomatoes
  include HTTParty
  
  base_uri = 'https://www.manpacks.com/api/update/user'
  @manpack_api_key = 'RQ44_V0WCREJHD3H2JP9'
  @manpack_user_key = 'KPWQ_WAX3WNLCP0OIPGT'
  Rotten.api_key = '34r59jew67w375sraaqhm33q'

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])
    @rotten_movie = RottenMovie.find(:title => @movie.title, :limit => 1, :expand_results => true)
    @real_movie = RottenMovie.find(:id => @rotten_movie.id, :expand_results => true)
    @movie.title = @real_movie.title
    @movie.score = @real_movie.ratings.audience_score
    @movie.genre = @real_movie.genres
    @movie.will_shit_your_pants = false
    @movie.poster_url = @real_movie.posters.original
    notice_message = "You will not shit yourself.  But always remember: wipe from front to back."
    #will you shit your pants?
    if @real_movie.genres.include? 'Horror' and @real_movie.ratings.audience_score > 50
      @movie.will_shit_your_pants = true
      #@manpack = Manpacks.first
      options = { :body => {
        :userKey => '5I9K_QWRKIEKSL9QRKYM',
        :timestamp => Time.now.next_week.to_i }
      }
      response = self.class.post('https://www.manpacks.com/api/update/user/shipdate?api_key=' +
                                  'RQ44_V0WCREJHD3H2JP9', options)
      if response.code == 200 then 
        puts 'Successfully bumped your underwear order to next week, poop pants.'
        notice_message = 'Successfully bumped your underwear order to next week, pooppants.'
        puts response
      else
        puts 'Something went wrong. You should use the washing machine.'
        notice_message = 'Something went wrong. You should use the washing machine.'
        puts response
      end
    end
    
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: notice_message }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :ok }
    end
  end
end
