class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order(created_at: :desc)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path, notice: "Réservation enregistrée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :date, :time, :guests)
  end
end
