ActiveAdmin.register Ticket do
  permit_params :user_id, :event_id, :token, :auth_token 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :event_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :event_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
