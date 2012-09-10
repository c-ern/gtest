class User < ActiveRecord::Base
 acts_as_gmappable :latitude => 'latitude', :longitude => 'longitude', :process_geocoding => :geocode?,
                  :address => "address", :normalized_address => "address",
                  :msg => "Sorry, not even Google could figure out where that is"

 attr_accessible :address, :latitude, :longitude, :name

def gmaps4rails_address
  self.address
end

def geocode?
  (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
end

end
