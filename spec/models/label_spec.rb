require 'spec_helper'

describe Label do
  it { should belong_to(:camping) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(60) }
end
