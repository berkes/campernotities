require "spec_helper"

describe CampingsController do
  describe "GET show" do
    before do
      @camping = FactoryGirl.create(:camping)
      get :show, :id => @camping.id
    end
    it { should assign_to(:camping) }
    it { should assign_to(:title).with(@camping.name) }
  end
end
