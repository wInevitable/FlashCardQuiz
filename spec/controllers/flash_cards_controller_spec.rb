require 'rails_helper'

RSpec.describe FlashCardsController, type: :controller do

  context "creating a new Flash Card" do
    let(:stimulus) { "When does summer officially begin?" }
    let(:response) { "June 22" }

    it "has a form for flash cards"
    it "has a field for the stimulus"
    it "has a field for the response"
    it "has a submit button"

    it "should render new template on failed save with error when no stimulus is present" do
      post :create, flash_card: { response: :response, set_id: 1 }
      assigns[:flash_card].should be_new_record
      flash[:error].should_not be_nil
      response.should render_template('new')
    end

    it "should render new template on failed save with error when no response is present" do
      post :create, flash_card: { stimulus: :stimulus, set_id: 1 }
      assigns[:flash_card].should be_new_record
      flash[:error].should_not be_nil
      response.should render_template('new')
    end

    it "should redirect to the home page with a notice on successful save" do
      post :create, flash_card: { stimulus: :stimulus, response: :response, set_id: 1 }
      assigns[:flash_card].should_not be_new_record
      flash[:notice].should_not be_nil
      response.should redirect_to(root_url)
    end

    it "should pass params to controller" do
      post :create, flash_card: { stimulus: :stimulus, response: :response, set_id: 1 }
      assigns[:flash_card].stimulus.should == 'When does summer officially begin?'
      assigns[:flash_card].response.should == 'June 22'
      assigns[:flash_card].set_id.should == 1
    end
  end

  context "displaying a Flash Card" do
  end
end
