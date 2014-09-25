################################################################################
#   Model: Level
#
#   Professional Levels of Employees
#
#   Handled via Admin
#
#   Attributes:
#     rank        - Level rank (not null, unique)
#     name        - Level name (not null, unique)
#     title       - Level title locale (not null)
#
#   07.09.2014  ZT created
################################################################################
class Level < ActiveRecord::Base
  has_many :actioncards
  has_many :behaviors
  has_many :users

  validates :rank,  presence: true, uniqueness: true
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end

