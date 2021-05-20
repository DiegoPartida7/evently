ActiveAdmin.register Event do
  permit_params :title, :image, :tickets_available, :location,  :date, :type, :event_type, :user_id
  # == Menu =================================================================

  # == Includes =============================================================

  # == Scopes ===============================================================
  # scope :all, default: true
  # scope :pending
  # scope :succeeded
  # scope :failed
  # scope :refunded
  # scope :charged_back
  # scope :under_review
  # scope :errored
  # scope :fraud

  # == Permit Params ========================================================
  
  # == Filters ==============================================================
  
  # == Extensions ===========================================================
  
  # == Index ================================================================
  # index do
  #   selectable_column
  #   id_column
  #   column :owner
  #   number_column :amount, as: :currency, unit: '$'
  #   column :gateway
  #   column :status
  #   column :gateway_charge_id
  #   column :created_at

  #   actions
  # end
  # == Show =================================================================

  # action_item :refund, only: [:show] do
  #   link_to 'Hacer reembolso', refund_admin_order_path(resource), method: :post, data: { confirm: "¿Estás seguro de que quieres hacer el reembolso?" } if resource.succeeded?
  # end


  # show do |u|
  #   attributes_table do
  #     row :id
  #     row :title
  #     row :tickets_available
  #     row :location
  #     row :date
  #     row :type
  #     row :image

  #   end
  # end

  #   panel 'Card data' do
  #     attributes_table_for order do
  #       row :card_token
  #       row :cardholder_name
  #       row :card_expiry
  #       row :card_funding
  #       row :card_brand
  #       row :card_last_4_digits
  #     end
  #   end

  #   active_admin_comments # Shows the default comments panel by AA
  # end

  # sidebar 'Order breakdown', only: :show do
  #   attributes_table_for order do
  #     number_row :amount, as: :currency, unit: '$'
  #     number_row :gateway_fee, as: :currency, unit: '$'
  #     number_row :taxes, as: :currency, unit: '$'
  #     number_row :digital_platform_tax, as: :currency, unit: '$'
  #     number_row :talent_earning, as: :currency, unit: '$'
  #     number_row :platform_fee, as: :currency, unit: '$'
  #     number_row :talent_agent_fee, as: :currency, unit: '$'
  #   end
  # end

  # == Form =================================================================
  form do |f|
    f.inputs 'Generales' do
      f.input :user
      f.input :title
      f.input :tickets_available
      f.input :location
      f.input :date, as: :datepicker
      # f.input :type,
      f.input :event_type,
        as: :select,
        collection: Event::EVENT_TYPES
      # f.select :event_type, Event::EVENT_TYPES
      f.input :image, as: :file
      # f.input :parent_id,
      #   as: :select,
      #   collection: ActsAsTaggableOn::Tag.select(:id, :name).all
      # f.input :visible
      # f.input :slug
    end

    f.actions
  end
  
  # == Controller ==========
  # member_action :refund, method: :post do
  #   resource.make_refund
  #   if resource.errors.blank?
  #     redirect_to resource_path, notice: "El refund fue exitoso"
  #   else
  #     redirect_to resource_path, notice:"El refund no fue procesado" + resource.errors.full_message
  #   end
  # end

end