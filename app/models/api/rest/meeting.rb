class Api::Rest::Meeting < ActiveRecord::Base

  acts_as_mappable

  has_and_belongs_to_many :games, uniq: true
  has_and_belongs_to_many :users, uniq: true

  validates_presence_of :name, :starts_at, :lat, :lng

  scope :filtered_by, -> (filter_params) do
    res = all

    if filter_params[:name].present?
      name = filter_params.delete :name

      res = res.where("api_rest_meetings.name ILIKE ?", "%#{name}%")
    end

    if filter_params[:games_ids].present?
      games_ids = filter_params.delete :games_ids

      res = res.joins(:games).where(api_rest_games: {id: games_ids})
    end

    if filter_params[:hour_from].present?
      hour_from = filter_params.delete :hour_from

      res = res.where("extract(hour from starts_at) >= ?", hour_from)
    end

    if filter_params[:hour_to].present?
      hour_to = filter_params.delete :hour_to

      res = res.where("extract(hour from starts_at) <= ?", hour_to)
    end

    if filter_params[:weekday].present?
      weekday = filter_params.delete :weekday

      res = res.where("extract(dow from starts_at) = ?", weekday)
    end

    if filter_params[:distance].present?
      distance = filter_params.delete :distance
      if [:lat, :lng].all? {|key| filter_params[key].present? }
        lat = filter_params.delete :lat
        lng = filter_params.delete :lng

        my_location = Geokit::LatLng.new(lat, lng)
      else
        my_location = Geokit::Geocoders::MultiGeocoder.geocode(filter_params.delete(:ip))
      end
      res = res.within(distance, origin: my_location)

    end

    res
  end

  scope :ordered_by, -> (order_params) do

    ordering = order_params.delete :order

    case ordering
    when "distance"
      if [:lat, :lng].all? {|key| order_params.key? key}
        lat = order_params.delete :lat
        lng = order_params.delete :lng

        my_location = Geokit::LatLng.new(lat, lng)
      else
        my_location = Geokit::Geocoders::MultiGeocoder.geocode(order_params.delete(:ip))
      end

      by_distance(origin: my_location)
    when "starts_at"
      order("starts_at ASC")
    when "name"
      order("name ASC")
    end
  end

end
