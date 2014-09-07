################################################################################
#   Model: Role
#
#   Contains list of users' roles in the Application
#
#   Handled via Admin
#
#   Attributes:
#     name  - the Role name
#     title - the Role title locale
#
#   07.09.2014  ZT created
################################################################################
class Role < ActiveRecord::Base
  has_many :users

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end