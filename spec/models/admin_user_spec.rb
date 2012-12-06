require 'spec_helper'

describe AdminUser do
  it {should have_many(:campings) }
  it {should validate_presence_of(:name)}
end
