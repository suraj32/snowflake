class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end
  
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      InsertModelDataJob.perform_now(@upload.id)
      flash[:success] = "File uploaded successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def get_roles
    roles = Role.all
    respond_to do |format|
      format.json { render json: roles.as_json(only: [:_id, :name]) }
    end
  end

  def get_track_categories
    role = Role.find(params[:id])
    track_categories = role.track_categories
    respond_to do |format|
      format.json { render json: track_categories.as_json(only: [:_id, :name]) }
    end
  end

  def get_tracks
    track_category = TrackCategory.find(params[:id])
    tracks = track_category.tracks
    respond_to do |format|
      format.json { render json: tracks.as_json(only: [:_id, :name]) }
    end
  end

  def destroy
    upload = Upload.find(params[:id])
    upload.destroy
    redirect_to(uploads_path)
  end

  private
    def upload_params
      params.require(:upload).permit(:input_file, :type_of_file, :role,
       :track_category, :track)
    end
end