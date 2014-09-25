################################################################################
#   Model: Assessment
#
#   List of Assessments (BORDs) passed by the User
#
#   Attributes:
#     user_id     - FK
#     closed      - The Assessment completed by User's manager (boolean)
#     max_level   - Maximal level passed by the User during the Assessment
#
#   19.09.2014  ZT created
################################################################################
class Assessment < ActiveRecord::Base
  belongs_to :user

  has_many   :items
  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  validates  :user_id,   presence: true
  validates  :closed,    inclusion: {in: [true, false]}
  validates  :max_level, presence: true

  scope :closed, -> {where closed: true}
  scope :opened, -> {where closed: false}

  def closed?
    self.closed
  end
end
