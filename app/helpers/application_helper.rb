module ApplicationHelper
  ALERT_TYPES = [:error, :info, :success, :warning, :danger, :notice, :alert]
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      if type == :error
        type = :danger
        logger.info "Flash error is deprecated use danger instead"
      elsif type == :alert || type == :notice
        type = :warning
      end

      ALERT_TYPES.include?(type)
      next unless ALERT_TYPES.include?(type.to_sym)
      Array(message).each do |msg|
        msg = msg.first if msg.class == Array
        msg = "Error" if msg.class == Hash
        text = content_tag(:div,
                          content_tag(:button, raw("&times;"), :class => 'close', 'data-dismiss' => 'alert') +
                          msg.html_safe, class: "alert alert-#{type} alert-dismissible alert-system", 'role'=> 'alert')
        flash_messages << text if msg
      end
    end
    flash_messages << "<script>$('.alert-system').fadeIn(200).delay(5000).fadeOut(200)</script>"
    return flash_messages.join("\n").html_safe
  end

  def wrapper_mappings
    wrapper_mappings = {check_boxes: :vertical_radio_and_checkboxes, radio_buttons: :vertical_radio_and_checkboxes, file: :vertical_file_input, boolean: :vertical_boolean}
  end
end
