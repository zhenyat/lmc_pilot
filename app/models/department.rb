################################################################################
#   Model: Department
#
#   List of Departments in Stores
#
#   Handled via Admin
#
#   Attributes:
#     number  - the Department number
#     title - the Department title locale
#
#   07.09.2014  ZT created
################################################################################
class Department < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true
  validates :title,  presence: true
end
