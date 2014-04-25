class ProfileMusicsController < ApplicationController
  before_action :set_profile_music, only: [:show, :edit, :update, :destroy]

  # GET /profile_musics
  # GET /profile_musics.json
  # author : ahmad bassiouny
  # list all the music profile of the looged in child
  # comlixty O(n)
  # paremtaers : nill
  # return : all profile musics 
  def index
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @user = Child.find_by(registered_user_id: current_user.id)
        @profile_musics = ProfileMusic.all
      else
        # Must be a supervisor.
        redirect_to controller: :supervisors, action: :show
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end

  # GET /profile_musics/1
  # GET /profile_musics/1.json
  # author : ahmad bassiouny
  # paremtaers : nill
  # return : null
  def show
  end

  # GET /profile_musics/new
  # author : ahmad bassiouny
  # redirect to the form page that create the app
  #  if the logged is a child
<<<<<<< HEAD
  # comlixty O(n)
=======
  # comlixty O(1)
>>>>>>> 68354cf072030ec4b6b65b0b31d7442a9e9ea6d9
  # paremtaers : nill
  # return : nil
  def new
    if signed_in?
      # Is user a supervisor?
      if Child.exists?(registered_user_id: current_user.id)
        @user = Child.find_by(registered_user_id: current_user.id)
        @profile_music = ProfileMusic.new
      else
        # Must be a supervisor.
        redirect_to controller: :supervisors, action: :show
      end
    else
      # No one signed in
      redirect_to session_path :new
    end
  end
   
  # author : ahmad bassiouny
  # edit .. no work here
  # comlixty _
  # paremtaers : nill
  # edit
  # GET /profile_musics/1/edit
  def edit
  end

  # POST /profile_musics
  # POST /profile_musics.json
  # author : ahmad bassiouny
  # creating a profile music and saving values in db
  # and get the current.idand save in the table
  # comlixty O(n)
  # paremtaers : nill
  # return : all profile musics 
  def create
    @profile_music = ProfileMusic.new(profile_music_params)

    respond_to do |format|
      if @profile_music.save
        @profile_music.update_column(:user_id, current_user.id)
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
  # author : ahmad bassiouny
  # no work done
<<<<<<< HEAD
  # comlixty : O(n)
=======
  # comlixty _
>>>>>>> 68354cf072030ec4b6b65b0b31d7442a9e9ea6d9
  # paremtaers : nill
  # return : new Profile opject
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
  # author : ahmad bassiouny
  # remove
  # comlixty O(n)
  # paremtaers : nill
  # return : nill
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
      params.require(:profile_music).permit(:mp3_url, :youtube_url, :user_id)
    end
end
