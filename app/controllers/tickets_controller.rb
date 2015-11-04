class TicketsController < ApplicationController
  before_action authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to '/users'
    else
      render 'new'
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:message)
  end
end
