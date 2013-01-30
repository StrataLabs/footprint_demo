class BookFootprint < Footprint::Impression
  store_in collection: "books"
  field :mrp_cost, type: Integer
  field :jb_cost, type: Integer
  field :location, type: Integer
  field :origlocation, type: Integer
  field :times_rented, type: Integer
   
  field :phase, type: String
  field :parent_id, type: Integer
  field :parent_type, type: String
end