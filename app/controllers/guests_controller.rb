# frozen_string_literal: true

class GuestsController < ApplicationController
  def new
    respond_to :html

    @guest = Guest.new
  end

  def create
    respond_to :html

    @guest = Guest.new(guest_params)

    if ENV['RECAPTCHA_SECRET_KEY'].blank?
      logger.info "Recaptcha not configured"
    end

    unless ENV['RECAPTCHA_SECRET_KEY'].blank? || verify_recaptcha(model: @guest)
      logger.info "Recaptcha failed for guest #{guest_params[:email]}"
      render :new
      return
    end

    if (not ENV['RECAPTCHA_SECRET_KEY'].blank?) && verify_recaptcha(model: @guest)
      logger.info "Recaptcha passed for guest #{guest_params[:email]}"
    end

    if @guest.save
      redirect_to guest_path(@guest)
    else
      existing_guest = Guest.find_by(email: guest_params[:email])
      if existing_guest
        @guest = existing_guest
        GuestMailer.welcome_back_email(@guest).deliver_now
        render :new_exists
      else
        render :new
      end
    end
  end

  def show
    respond_to :html

    @guest = Guest.find_by_id_token(params[:id])
  end

  def update
    @guest = Guest.find_by_id_token(params[:id])

    if @guest.update(guest_params)
      if params[:guest].include?(:staying_overnight)
        redirect_to confirm_guest_path(@guest)
      elsif @guest.attending?
        redirect_to guest_plus_ones_path(@guest)
      else
        redirect_to confirm_guest_path(@guest)
      end
    else
      render :show
    end
  end

  def more_info
    respond_to :html

    @guest = Guest.find_by_id_token(params[:id])


  end

  def confirm
    respond_to :html

    @guest = Guest.find_by_id_token(params[:id])
  end

  def complete
    respond_to :html

    @guest = Guest.find_by_id_token(params[:id])
    Guest.transaction do
      @guest.update!(guest_params)
      @guest.touch :confirmed_at
    end
    GuestMailer.confirmation_email(@guest).deliver_now
  end

  private

  def guest_params
    params.require(:guest).permit(
      :email, :first_name, :last_name, :attending, :diet, :songs, :notes, :staying_overnight, :dog
    )
  end
end
