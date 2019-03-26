class LevelsController < ApplicationController
	def index
		@levels = Level.all
	end

	def edit
		@level = Level.find(params[:id])
	end

	def update
		level = Level.find(params[:id])

		if level.update(level_params)
    	redirect_to levels_path
  	else
    	render 'edit'
    end
	end

	def destroy
		level = Level.find(params[:id])
		level.destroy

		redirect_to levels_path
	end

	private
		def level_params
			params.require(:level).permit(
				:seq_no,
				:description,
				example_behaviour: [],
				example_task: []
			)
		end
end
