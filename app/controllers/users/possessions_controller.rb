class Users::PossessionsController < ApplicationController
  def self.local_prefixes
    [controller_path, controller_path.sub(/^users\//, '')]
  end

  def index
    p params
    @pagy, @works = pagy(User.find(params[:user_id]).works, items: 5)
    render "works/index"
  end
end
