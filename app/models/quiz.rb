class Quiz < ActiveRecord::Base
  validates :score, :set_id, presence: :true
end
