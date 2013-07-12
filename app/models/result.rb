class Result
  include Mongoid::Document
  field :result_id, type: Integer 
  field :participant_id, type: Integer

  has_many :answers
end
