require 'spec_helper'

describe MapsController do
  describe "GET 'index'" do
    before do
      get :index
    end
    it { should assign_to(:title) }
    it { should respond_with(:success) }
    it { should assign_to(:pins).with(Camping.top(50).geocoded) }
  end
end
