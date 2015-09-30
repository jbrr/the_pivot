ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

def user
  @user ||= User.create(first_name: "Donald",
                         last_name: "Trump",
                             email: "trump@luxury.com",
                          username: "therealtrump",
                          password: "password",
             password_confirmation: "password")
end

def candidate
  @candidate ||= Candidate.find_or_create_by(name: "Ted Cruz",
                                            party: "Republican",
                                              bio: "Kim Davis",
                                        last_name: "cruz")
end

def issue
  @issue ||= Issue.create(topic: "Gun Control",
                    description: "Guns Guns Guns!",
                        picture: "immigration")
end

def candidate_issue
  @candidate_issue ||= CandidateIssue.create(candidate_id: candidate.id,
                                                 issue_id: issue.id,
                                                   stance: "Guns!")
end

def order
  @order ||= Order.create(total: 100, user_id: user.id)
end

def test_setup
  user
  candidate
  issue
  candidate_issue
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.backtrace_exclusion_patterns << %r{/gems/}

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
end
