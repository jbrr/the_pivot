ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

def registered_user
  @registered_user = Role.create(name: "registered_user")
end

def campaign_manager
  @campaign_manager = Role.create(name: "campaign_manager")
end

def platform_admin
  @platform_admin = Role.create(name: "platform_admin")
end

def user
  @user ||= User.create(first_name: "Donald",
                         last_name: "Trump",
                             email: "trump@luxury.com",
                          username: "therealtrump",
                          password: "password",
             password_confirmation: "password")
end

def user2
  @user2 ||= User.create(first_name: "regis",
                      last_name: "regis",
                      email: "regis@regis.com",
                      username: "Regis",
                      password: "password",
                      password_confirmation: "password")
end

def manager
  @manager ||= User.create(first_name: "manager",
                           last_name: "manager",
                           email: "manager@manager.com",
                           username: "manager",
                           password: "password",
                           password_confirmation: "password")
end

def admin
  @admin ||= User.create(first_name: "admin",
                         last_name: "admin",
                         email: "admin@admin.com",
                         username: "admin",
                         password: "password",
                         password_confirmation: "password")

end

def user_permissions
  @user.user_roles << UserRole.create(user_id: user.id,
                                      role_id: registered_user.id)
end

def user2_permissions
  @user2.user_roles << UserRole.create(user_id: user2.id,
                                       role_id: registered_user.id)
end

def plat_admin_permissions
  @admin.user_roles << UserRole.create(user_id: admin.id,
                                       role_id: platform_admin.id)
end

def candidate
  @candidate ||= Candidate.find_or_create_by(name: "Ted Cruz",
                                            party: "Republican",
                                              bio: "Kim Davis",
                                        last_name: "cruz")
end

def manager_permissions
  @manager.user_roles << UserRole.create(user_id: manager.id,
                                         role_id: campaign_manager.id,
                                         candidate_id: candidate.id)
end

def candidate2
  @candidate2 ||= Candidate.create(name: "Donald Trump",
                                  party: "Republican",
                                    bio: "Luxury",
                              last_name: "trump")
end

def issue
  @issue ||= Issue.create(topic: "Gun Control",
                    description: "Guns Guns Guns!",
                        picture: "immigration")
end

def issue2
  @issue2 ||= Issue.create(topic: "Environment",
                     description: "Save the whales!",
                         picture: "environment")
end

def candidate_issue
  @candidate_issue ||= CandidateIssue.create(candidate_id: candidate.id,
                                                 issue_id: issue.id,
                                                   stance: "Guns!")
end

def candidate_issue2
  @candidate_issue2 ||= CandidateIssue.create(candidate: candidate2,
                                                  issue: issue,
                                                 stance: "Luxurious guns!")
end

def order
  @order ||= Order.create(total: 100,
                        user_id: user.id)
end

def test_setup
  registered_user
  campaign_manager
  platform_admin
  user
  user2
  manager
  admin
  user_permissions
  user2_permissions
  manager_permissions
  plat_admin_permissions
  candidate
  issue
  issue2
  candidate_issue
  candidate_issue2
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
