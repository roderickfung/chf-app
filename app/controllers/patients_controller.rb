class PatientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @limit ||= 25
    @data = Patient.order(id: :asc).page(params[:page]).per(@limit)
  end

  def show

  end
end
