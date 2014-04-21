class ProfileMusicsController < ApplicationController
  before_action :set_profile_music, only: [:show, :edit, :update, :destroy]

  # GET /profile_musics
  # GET /profile_musics.json
  def index
    @profile_musics = ProfileMusic.all
  end

  # GET /profile_musics/1
  # GET /profile_musics/1.json
  def show
  end

  # GET /profile_musics/new
  def new
    @profile_music = ProfileMusic.new
  end

  # GET /profile_musics/1/edit
  def edit
  end

  # POST /profile_musics
  # POST /profile_musics.json
  def create
    @profile_music = ProfileMusic.new(profile_music_params)

    respond_to do |format|
      if @profile_music.save
        format.html { redirect_to @profile_music, notice: 'Profile music was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile_music }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_musics/1
  # PATCH/PUT /profile_musics/1.json
  def update
    respond_to do |format|
      if @profile_music.update(profile_music_params)
        format.html { redirect_to @profile_music, notice: 'Profile music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile_music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_musics/1
  # DELETE /profile_musics/1.json
  def destroy
    @profile_music.destroy
    respond_to do |format|
      format.html { redirect_to profile_musics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_music
      @profile_music = ProfileMusic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_music_params
      params.require(:profile_music).permit(:youtube_url, :user_id)
    end
end
