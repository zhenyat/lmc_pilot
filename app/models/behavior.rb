################################################################################
#   Model: Behavior
#
#   Behavior Indices for definite Competency / Level
#
#   Handled via Admin
#
#   Attributes:
#     competency_id - FK
#     level_id      - FK
#     content       - Behavior Index description (not null)
#     active,       - Behavior Index status (not null, default = true)
#
#   07.09.2014  ZT created
################################################################################
class Behavior < ActiveRecord::Base
#  has_many   :assessments
  has_many   :items

  belongs_to :competency
  belongs_to :level

  validates :competency_id, presence: true
  validates :level_id,      presence: true
  validates :content,       presence: true
  validates :active,       inclusion: {in: [true, false]}

  scope :active, -> {where active: true}

  def active?
    self.active
  end
end
