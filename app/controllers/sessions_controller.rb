class SessionsController < ApplicationController
  layout "landing"

  def new

  end

  def create
    @acc = params[:account]
    if @acc.include?('@')
      @user = Clinician.find_by_email params[:account]
      @type = 'Clinician'
    else
      @user = Patient.find_by_care_id params[:account]
      @type = 'Patient'
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed In Successfully"
    else
      flash[:alert] = "Wrong Credentials"
      render :new
    end
  end

  def destroy

  end

end
