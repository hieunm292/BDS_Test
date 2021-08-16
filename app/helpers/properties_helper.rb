module PropertiesHelper
  def property_thumbnail(property)
    img = property.photo.present? ? property.photo : ''
    image_tag img, class: 'img-thub'
  end
end
