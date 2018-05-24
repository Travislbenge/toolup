class BookingsController < ApplicationController
  # This is the bookingscontroller, superfluous commenting
  def index
    @bookings = policy_scope(Booking)
    # @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new #(booking_params)
    # Linking the models
    @booking.tool = Tool.find(params[:tool_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy(booking_params)
    redirect_to bookings_path
  end

private

  # def booking_params
  #     params.require(:booking).permit()
  # end


end

