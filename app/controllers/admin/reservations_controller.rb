
class Admin::ReservationsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret"
  before_action :require_admin
  def require_admin
    unless session[:admin]
      redirect_to admin_login_path, alert: "Veuillez vous connecter"
    end
  end


  def index
    @reservations = Reservation.all.order(created_at: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path, notice: "Réservation supprimée."
  end
end


# http_basic_authenticate_with name: "admin", password: "secret"
