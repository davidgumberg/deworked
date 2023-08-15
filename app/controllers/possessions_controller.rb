class PossessionsController < ApplicationController
  prepend_before_action :authenticate_user!
  before_action :set_possession, only: [:destroy]

  def create
    Possession.create(possession_params)
  end

  def destroy
    @possession.destroy
  end

  private
    def set_possession
      @possession = Possession.find(params[:id])
    end

    def possession_params
      possession_params = params.require(:possession).permit(:work_id)
      possession_params.merge(user: current_user)
    end
end
