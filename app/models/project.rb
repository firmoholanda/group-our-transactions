class Project < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :projects_groups
  has_many :groups, -> { distinct }, through: :projects_groups

  validates :name, presence: true
  validates :hours, presence: true

  default_scope { order(created_at: :desc) }
  # scope :with_group, -> { projects_groups(:group_id).where(projects_groups: { group_id: nil } }
  # scope :no_group, -> { joins(:projects_groups).where("group_id = ?", false) }
  scope :no_group, -> { where(group_id: nil) }
end
