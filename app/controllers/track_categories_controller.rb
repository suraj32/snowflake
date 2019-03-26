class TrackCategoriesController < ApplicationController
	def index
		@track_categories = TrackCategory.all
	end

	def edit
		@track_category = TrackCategory.find(params[:id])
	end

	def update
		track_category = TrackCategory.find(params[:id])

		if track_category.update(track_category_params)
    	redirect_to track_categories_path
  	else
    	render 'edit'
  	end
	end

	def destroy
		track_category = TrackCategory.find(params[:id])
  	track_category.destroy

  	redirect_to track_categories_path
	end

	private
		def track_category_params
			params.require(:track_category).permit(:name, :description)
		end
end
