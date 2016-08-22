class CliniciansController < ApplicationController
  before_action :authenticate_user!

  def index
    @limit ||= 25
    @data = Clinician.order(id: :asc).page(params[:page]).per(@limit)
  end

  def show
    @data = Clinician.find params[:id]
  end
end
