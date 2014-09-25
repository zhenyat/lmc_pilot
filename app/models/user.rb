################################################################################
#   Model: User
#
#   Users authorized to sign in
#
#   Handled via Admin
#
#   Attributes:
#     store_id        - Foregn Key
#     department_id   - FK
#     positin_id      - FK
#     level_id        - FK
#     manager_id      - FK (internal associate)
#     login           - login (to be User's ID)
#     last_name
#     first_name
#     middle_name
#     active          - Assessment is allowed
#     password_digest - password secuired (not null)
#     remember_token  - to keep session on
#
#   07.09.2014  ZT created
#   15.09.2014  Updated (no Employee entity)
#   18.09.2014  manager? method added
################################################################################
class User < ActiveRecord::Base
  has_many   :assessments

  has_many   :subordinates, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager,      class_name: "User"

  belongs_to :store
  belongs_to :department
  belongs_to :position
  belongs_to :level

  before_save :create_remember_token

  validates :store_id,      presence: true
  validates :department_id, presence: true
  validates :position_id,   presence: true
  validates :level_id,      presence: true
  validates :login,         presence: true, uniqueness: true
  validates :last_name,     presence: true
  validates :first_name,    presence: true
  validates :active,       inclusion: {in: [true, false]}

  has_secure_password
  validates :password,              presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true

  scope :active,       -> {where active: true}

  def active?
    self.active
  end

  def admin?
    self.department.number == '99'
  end

  def guest?
    self.department.number == '97'
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  def manager?
    self.subordinates.count > 0
  end

  def hr?
    self.position.name == 'hr'
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
