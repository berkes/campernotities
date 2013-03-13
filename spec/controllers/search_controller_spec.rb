require 'spec_helper'

describe SearchController do
  context "filtered by label" do
    before do
      get :index
    end

    it { should assign_to(:campings) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  it 'should use metasearch to determine the campings' do
    Camping.should_receive(:search)
    get :index
  end
end
