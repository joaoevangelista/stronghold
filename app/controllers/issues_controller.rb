# frozen_string_literal: true
# :nodoc:
class IssuesController < AuthenticatedController
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :open, :close]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.order(:updated_at).page params[:page]
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @assignee = User.find(@issue.assignee_id) if @issue.assignee_id
  end

  # GET /issues/new
  def new
    @issue = Issue.new(user_id: current_user.id)
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: I18n.t('issue.create_message') }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: I18n.t('issue.update_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1/open
  def open
    respond_to do |format|
      if @issue.update(is_resolved: false)
        @issue.create_activity :issue_opened
        format.html { redirect_to @issue, notice: I18n.t('issue.open_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1/close

  def close
    respond_to do |format|
      if @issue.update(is_resolved: true)
        @issue.create_activity :issue_closed
        format.html { redirect_to @issue, notice: I18n.t('issue.close_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: I18n.t('issue.close_message') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:title, :description, :is_resolved,
                                  :user_id, :due_date, :assignee_id, :issue_type_id)
  end
end
