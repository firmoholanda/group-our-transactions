class Project < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'

  has_many :projects_groups
  has_many :groups, -> { distinct }, through: :groupings
  
  validates :name, presence: true
  validates :hours, presence: true
end
