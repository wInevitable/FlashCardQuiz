class Quiz < ActiveRecord::Base
  validates :score, :set_id, presence: :true

  def self.high_score
    Quiz.order(score: :desc).first
  end
end
