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
      flash[:success] = "File #{@upload.id} imported successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def get_roles
  	@roles = Role.all
  	respond_to do |format|
  		format.json { render json: @roles.as_json(only: [:name]) }
  	end
  end

  def get_track_categories
  	@roles = Role.find_by(name: params[:type])
  	@track_categories = @roles.track_categories
  	respond_to do |format|
  		format.json { render json: @track_categories.as_json(only: [:name]) }
  	end
  end

  def get_tracks
  	@roles = Role.find_by(name: params[:role_type])
  	@track_categories = @roles.track_categories.find_by(name: params[:track_category_type])
  	@tracks = @track_categories.tracks
  	respond_to do |format|
  		format.json { render json: @tracks.as_json(only: [:name]) }
  	end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to(uploads_path)
  end

  private
  	def upload_params
			params.require(:upload).permit(:file, :type_of_file, :role, :track_category, :track)
		end
end