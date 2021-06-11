class TicketMailer < ApplicationMailer
  def new_ticket_email
    @ticket = params[:ticket]
    @recipient = User.find(@ticket.user_id)

    mail(to: @recipient.email, subject: "Compraste un boleto")
  end
end
