class PossessionsController < ApplicationController
  prepend_before_action :authenticate_user!
  before_action :set_possession, only: [:destroy]

  def create
    @possession = Possession.create(possession_params)
    respond_to do |format|
      format.html {render partial: 'addremove', locals: { work: @possession.work }}
    end

  end

  def destroy
    # Save work before destroying possession
    work = @possession.work
    @possession.destroy
    respond_to do |format|
      format.html {render partial: 'addremove', locals: { work: work }}
    end
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
