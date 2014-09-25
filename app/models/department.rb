################################################################################
#   Model: Department
#
#   List of Departments in Stores
#
#   Handled via Admin
#
#   Attributes:
#     number  - the Department number
#     title   - the Department title locale
#
#   07.09.2014  ZT created
################################################################################
class Department < ActiveRecord::Base
  has_many :users

  validates :number, presence: true, uniqueness: true
  validates :title,  presence: true

  scope :actual, -> {where 'number in (?)', 01..15}
end
