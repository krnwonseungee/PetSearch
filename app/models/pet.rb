class Pet
	include Mongoid::Document
	include Mongoid::Timestamps
	include Geocoder::Model::Mongoid

  field :name, :default => " "
  field :age
  field :gender
  field :size
  field :description
  field :species #either 'Cat' or 'Dog'
  field :status  #'Available', 'Fostered', 'Adopted', 'Deleted'
  field :organization_name
  field :is_housebroken, type: Boolean
  field :is_housetrained, type: Boolean
  field :is_hypoallergenic, type: Boolean
  field :tail
  field :color
  field :primary_breed
  field :secondary_breed
  field :hair_length
  field :contact_street_address
  field :contact_city
  field :contact_state
  field :contact_zipcode
  field :contact_phone
  field :contact_fax
  field :contact_email
  field :address
  field :coordinates, :type => Array
  geocoded_by :address
  after_validation :geocode

  def get_gender
    gender == "F" ? "Female ♀" : "Male ♂"
  end

  def get_size
    if size == "S"
      "Small"
    elsif pet.size == "M"
      "Medium"
    else
      "Large"
    end
  end
end
