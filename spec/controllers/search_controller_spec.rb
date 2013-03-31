require 'spec_helper'

describe SearchController do
  context "filtered by label" do
    before do
      get :index
    end

    it { should assign_to(:search) }
    it { should assign_to(:campings) }
    it { should assign_to(:flags).with_kind_of(Array) }
    it { should assign_to(:selects).with_kind_of(Array) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  it 'should use metasearch to determine the campings' do
    search_params = {"labels_name_contains_any"=>["Dogs Allowed"]}
    Camping.should_receive(:search).with(search_params).and_return(Camping)
    get(:index, :search => search_params)
  end

  describe "labels" do
    it 'should be the top 10' do
      Label.should_receive(:top).with(10).twice.and_return([])
      get :index
    end
  end

end
