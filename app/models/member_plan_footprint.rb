class MemberPlanFootprint < Footprint::Impression
  store_in collection: "member_plans"
  field :reading_fee_balance, type: Integer
  field :reading_fee_discount_balance, type: Integer
  field :monthly_reading_fee, type: Integer
end