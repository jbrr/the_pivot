require 'rails_helper'

RSpec.describe CandidateIssue, type: :model do
  it { should delegate_method(:topic).to :issue }
end
