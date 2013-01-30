class CheckFootprint < Footprint::Impression
  store_in collection: "checks"
  field :created_at, type: Date
  field :updated_at, type: Date
  field :name, type: String
  field :phase, type: String
  field :parent_id, type: Integer
  field :parent_type, type: String
end
