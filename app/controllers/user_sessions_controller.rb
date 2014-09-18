class UserSessionsController < ApplicationController

  respond_to :json, :html

  def new
    @session = UserSession.new(session)
    respond_with(@session) do |format|
      format.json {render :json => @session.as_json }
      format.html
    end
  end

  def create
    @session = UserSession.new(session, params[:user_session])
    if @session.authenticate
      render json: @session.as_json, status: :ok
    else
      render json: {user: @session.errors, status: :no_content}
    end
  end

  def destroy
    @session = UserSession.find(params[:id])
    render json: {status: :not_found} unless @session

    @session.destroy
    render json: {status: :ok}
  end
end
