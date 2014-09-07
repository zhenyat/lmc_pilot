################################################################################
#   Model: Store
#
#   Contains list of stores, participating in the Pilot project
#
#   Handled via Admin
#
#   Attributes:
#     name  - the Store name
#     title - the Store title locale
#
#   07.09.2014  ZT created
################################################################################
class Store < ActiveRecord::Base
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
