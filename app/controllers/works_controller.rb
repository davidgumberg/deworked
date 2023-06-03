class WorksController < ApplicationController
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /works or /works.json
  def index
    @works = Work.all
  end

  # GET /works/1 or /works/1.json
  def show
  end

  def ext
    @work = Work.new_from_isbn(params[:isbn])
    @params = { work: @work, ISBN: @work.ISBN, title: @work.title,
                cover_url: @work.cover_url, date_published: @work.date_published }
  end

  # GET /works/new
  def new
    @work = Work.new
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
      params.require(:work).permit(:title, :ISBN, :date_published, :cover_url,
                    voices_attributes: [:id, :style, author_attributes: [:id, :name, :birth, :death]])
    end
end
