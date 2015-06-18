class FlashCard < ActiveRecord::Base
  validates :stimulus, :response, :set_id, presence: :true
end
