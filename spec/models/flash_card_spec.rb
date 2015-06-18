require 'rails_helper'

RSpec.describe FlashCard, type: :model do
  context 'without a stimulus' do
    subject(:flash_card) { FlashCard.new(response: "June 22", set_id: 1) }
    it { should_not be_valid }
  end

  context 'without a response' do
    subject(:flash_card) { FlashCard.new(stimulus: "When does summer officially begin?", set_id: 1) }
    it { should_not be_valid }
  end

  context 'with a stimulus, response, and set id' do
    subject(:flash_card) { FlashCard.new(stimulus: "When does summer officially begin?", response: "June 22", set_id: 1) }

    it { should be_valid }
    it { should respond_to(:stimulus) }
    it { should respond_to(:response) }
    it { should respond_to(:set_id) }
  end
end
