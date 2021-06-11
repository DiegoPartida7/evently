class EventDecorator < Draper::Decorator
  delegate_all

  def image?
    result = object.image.present? ? object.image : 'caz.jpg'
    h.image_tag result, class:"img-cover2"
  end

end