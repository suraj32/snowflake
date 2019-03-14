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
    @upload = Upload.new(upload_params) do |t|
      if params[:upload][:data]
        t.data      = params[:upload][:data].read
        t.filename  = params[:upload][:data].original_filename
        t.mime_type = params[:upload][:data].content_type
      end
    end
    
    if @upload.save
    	InviteAdminsJob.perform_async(@upload.id)
      flash[:success] = "File imported successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def get_role_types
  	@roles = Role.all
  	respond_to do |format|
  		format.json { render json: @roles.as_json(only: [:name]) }
  	end
  end

  def get_track_category_types
  	@roles = Role.find_by(name: params[:type])
  	@track_categories = @roles.track_categories.all
  	respond_to do |format|
  		format.json { render json: @track_categories.as_json(only: [:name]) }
  	end
  end

  def get_track_types
  	byebug
  	@roles = Role.find_by(name: params[:role_type])
  	@track_categories = @roles.track_categories.find_by(name: params[:track_category_type])
  	@tracks = @track_categories.tracks.all
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
			params.require(:upload).permit(:select_type, :role_type, :track_category_type, :track_type, :data)
		end
end
