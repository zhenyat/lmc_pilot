################################################################################
#   Model: Cluster
#
#   Competency Clusters (Blocks)
#
#   Handled via Admin
#
#   Attributes:
#     name        - Cluster name (not null, unique)
#     title       - Cluster title locale (not null)
#     mutual      - true: if all Cluster competencies are the same for Positions & Levels
#     description - Cluster description (for hint)
#
#   07.09.2014  ZT created
################################################################################
class Cluster < ActiveRecord::Base
  has_many :competencies

  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true

  def mutual?
    self.mutual
  end
end