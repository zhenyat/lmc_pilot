################################################################################
#   Model: Position
#
#   Contains list of Positions in a Store
#
#   Handled via Admin
#
#   Attributes:
#     name  - the Position name
#     title - the Position title locale
#
#   07.09.2014  ZT created
################################################################################
class Position < ActiveRecord::Base
  has_many :competencies
  has_many :users

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
