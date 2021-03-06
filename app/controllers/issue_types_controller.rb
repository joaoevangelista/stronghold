# frozen_string_literal: true
# :nodoc:
class IssueTypesController < AuthenticatedController
  before_action :set_issue_type, only: [:show, :edit, :update, :destroy]

  # GET /issue_types
  # GET /issue_types.json
  def index
    authorize IssueType
    @issue_types = IssueType.all
  end

  # GET /issue_types/1
  # GET /issue_types/1.json
  def show
    authorize @issue_type
  end

  # GET /issue_types/new
  def new
    @issue_type = IssueType.new
    authorize @issue_type
  end

  # GET /issue_types/1/edit
  def edit
    authorize @issue_type
  end

  # POST /issue_types
  # POST /issue_types.json
  def create
    @issue_type = IssueType.new(issue_type_params)
    authorize @issue_type
    respond_to do |format|
      if @issue_type.save
        format.html do
          redirect_to @issue_type, notice: I18n.t('issue_type.create_message')
        end
        format.json { render :show, status: :created, location: @issue_type }
      else
        format.html { render :new }
        format.json { render json: @issue_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_types/1
  # PATCH/PUT /issue_types/1.json
  def update
    authorize @issue_type
    respond_to do |format|
      if @issue_type.update(issue_type_params)
        format.html do
          redirect_to @issue_type, notice: I18n.t('issue_type.update_message')
        end
        format.json { render :show, status: :ok, location: @issue_type }
      else
        format.html { render :edit }
        format.json { render json: @issue_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_types/1
  # DELETE /issue_types/1.json
  def destroy
    authorize @issue_type
    @issue_type.destroy
    respond_to do |format|
      format.html do
        redirect_to issue_types_url, notice: I18n.t('issue_type.destroy_message')
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue_type
    @issue_type = IssueType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_type_params
    params.require(:issue_type).permit(:name, :color)
  end
end
