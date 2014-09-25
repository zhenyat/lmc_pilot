################################################################################
#   Model: Item
#
#   Assessment Items with results (ticks) for the selected Behavior Index
#
#   Attributes:
#     assessment_id - FK
#     behavior_id   - FK
#     user_tick     - User's choice for the Behavior Index
#     final_tick    - Final  choice for the Behavior Index
#
#   19.09.2014  ZT created
################################################################################
class Item < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :behavior

  validates  :assessment_id, presence: true
  validates  :behavior_id,   presence: true
  validates  :user_tick,    inclusion: {in: [true, false]}
  validates  :final_tick,   inclusion: {in: [true, false]}
end
