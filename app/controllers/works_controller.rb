class WorksController < ApplicationController
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /works or /works.json
  def index
    @pagy, @works = pagy(Work.all, items: 5)
  end

  # GET /works/1 or /works/1.json
  def show
  end

  def ext
    @ext_params = Work.new_from_isbn(params[:isbn])
    @work = Work.new(@ext_params)
  end

  # GET /works/new
  def new
    @work = Work.new
    # Building an author ensures that the form renders at least one voice
    # form with a blank author
    @work.voices.build.build_author
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works or /works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to work_url(@work), notice: "Work was successfully created." }
        format.turbo_stream 
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1 or /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to work_url(@work), notice: "Work was successfully updated." }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1 or /works/1.json
  def destroy
    @work.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@work) }
      format.html         { redirect_to works_url, notice: "Work was successfully destroyed." }
      format.json         { head :no_content }
    end
  end

  def add_author
    @work = Work.new(work_params.merge({ id: params[:id] }))
    @work.voices.build.build_author

    render :new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(
        :title, :ISBN, :cover_url,
        :edition_publication_year, :edition_publication_month, :edition_publication_day,
        :original_publication_year, :original_publication_month, :original_publication_day,
        voices_attributes: [
          :id, :style,
          author_attributes: [
            :id, :name, :image,
            :birth_year, :birth_month, :birth_day,
            :death_year, :death_month, :death_day 
          ]
        ]
      )
    end
end
