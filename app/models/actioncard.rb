################################################################################
#   Model: Actioncard
#
#   Action Card containing required activities to improve qu`zlification
#
#   Handled via Admin
#
#   Attributes:
#     competency_id   - FK
#     level_id        - FK
#     content         - List of actions (string, not null)
#
#   16.09.2014  ZT created
################################################################################
class Actioncard < ActiveRecord::Base
  belongs_to :competency
  belongs_to :level

  validates  :content, presence: true
end
