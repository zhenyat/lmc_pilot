################################################################################
#   Model: Competency
#
#   Competencies for a given set of Cluster & Position
#
#   Handled via Admin
#
#   Attributes:
#     position_id - FK
#     cluster_id  - FK
#     name        - competency name (not null)
#     title       - competency title locale (not null)
#     rank        - competency rank (not null, default=1)
#     description - competency description
#
#   07.09.2014  ZT created
################################################################################
class Competency < ActiveRecord::Base
  has_many   :actioncards
  has_many   :behaviors

  belongs_to :cluster
  belongs_to :position

  validates :position_id, presence: true
  validates :cluster_id,  presence: true
  validates :name,        presence: true
  validates :title,       presence: true
  validates :rank,        presence: true
end