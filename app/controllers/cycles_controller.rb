class CyclesController < ApplicationController
  #It is assumed that only one cycle will be open at a time
  def index
    @cycles = Cycle.all
  end

  def new
    @cycle = Cycle.new
  end

  def edit
    @cycle = Cycle.find(params[:id])
  end

  def create
    @cycle = Cycle.new(cycle_params)

    if @cycle.save
      redirect_to cycles_path
    else
      render 'new'
    end
  end

  def update
    @cycle = Cycle.find(params[:id])

    if @cycle.update(cycle_params)
      redirect_to cycles_path
    else
      render 'new'
    end
  end

  def destroy
    @cycle = Cycle.find(params[:id])
    @cycle.destroy

    redirect_to cycles_path
  end

  private
    def cycle_params
      params.require(:cycle).permit(
        :emp_duration_start,
        :emp_duration_end,
        :manager_duration_start,
        :manager_duration_end,
        :is_open
      )
    end
end
