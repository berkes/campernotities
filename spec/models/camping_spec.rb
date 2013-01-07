require 'spec_helper'

describe Camping do
  it { should belong_to(:author) }
  it { should validate_presence_of(:author) }
end
