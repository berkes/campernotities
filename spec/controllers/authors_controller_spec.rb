require 'spec_helper'

describe AuthorsController do
  let(:author) { mock_model(AdminUser).as_null_object }

  context "#index" do
    before do
      AdminUser.stub(:find).and_return([author])
      get :index
    end

    it { should assign_to(:title) }
    it { should assign_to(:authors).with [author] }
  end

  context "#home" do
    before do
      AdminUser.stub(:find).and_return([author])
      get :home
    end

    it { should assign_to(:authors).with [author] }
  end

  context "#show" do
    before(:each) do
      AdminUser.stub(:find).and_return(author)
      author.stub(:campings).and_return []
      get :show, :id => author.id
    end

    it { should assign_to(:author).with(author) }
    it { should assign_to(:campings).with(author.campings) }
    it { should assign_to(:title) }
  end
end
