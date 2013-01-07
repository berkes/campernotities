require 'spec_helper'

describe AuthorsController do
  context "#show" do
    let(:author) { mock_model(AdminUser).as_null_object }

    before(:each) do
      AdminUser.stub(:find).and_return(author)
      author.stub(:campings).and_return []
    end

    it 'loads the user' do
      AdminUser.should_receive(:find).with author.id.to_s
      get :show, :id => author.id

      expect(assigns(:author)).to eq author
    end

    it 'loads the campings for this user' do
      author.should_receive(:campings)
      get :show, :id => author.id

      expect(assigns(:campings)).to eq []
    end
  end
end
