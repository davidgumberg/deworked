class PossessionsController < ApplicationController
  before_action :authenticate_user!, only: [:add]

  def add
    Possession.create(possession_params)
  end

  def possession_params
    possession_params = params.require(:possession).permit(
      :work_id
    )

    possession_params.merge(user: current_user)
  end
end
