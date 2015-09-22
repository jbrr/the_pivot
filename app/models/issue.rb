class Issue < ActiveRecord::Base
  validates :topic, :description, presence: true
end
