# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  def new_ticket_email
    # Set up a temporary order for the preview
    ticket = Ticket.new(seat_number: 15, event_id: 6, user_id:3)

    TicketMailer.with(ticket: ticket).new_ticket_email
  end
end
