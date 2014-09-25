################################################################################
#   Model: Store
#
#   Contains list of stores, participating in the Pilot project
#
#   Handled via Admin
#
#   Attributes:
#     name   - the Store name               (string, not null, unique)
#     title  - the Store title locale       (string, not null)
#     active - the Store assessment status  (boolean, default: false)
#
#   07.09.2014  ZT created
#   15.09.2014  Last update (attribute 'active' added)
################################################################################
class Store < ActiveRecord::Base
  has_many :users

  validates :name,   presence:  true, uniqueness: true
  validates :title,  presence:  true
  validates :active, inclusion: {in: [true, false]}

  scope :active, -> {where active: true}
  end
