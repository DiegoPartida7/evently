class TicketObserver < ActiveRecord::Observer
  def after_save(ticket)
    TicketMailer.with(ticket: ticket).new_ticket_email.deliver_now!
  end
end
