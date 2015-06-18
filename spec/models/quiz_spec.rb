require 'rails_helper'

RSpec.describe Quiz, type: :model do
  # Not testing a quiz without a score as the score is set to 0 by default

  context 'without a set_id' do
    subject(:quiz) { Quiz.new() }
    it { should_not be_valid }
  end

  context 'with a score and set id' do
    subject(:quiz) { Quiz.new(set_id: 1) }

    it { should be_valid }
    it { should respond_to(:score) }
    it { should respond_to(:set_id) }
  end
end
