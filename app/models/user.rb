################################################################################
#   Model: User
#
#   Users authorized to sign in
#
#   Handled via Admin
#
#   Attributes:
#     role_id          - Foregn Key
#     login            - login name (not null, unique)
#     password_digest  - password secuired (not null)
#     remember_token   - to keep session on
#
#   07.09.2014  ZT created
################################################################################
class User < ActiveRecord::Base
  belongs_to :role

  has_secure_password

  before_save :create_remember_token

  validates :role_id,               presence: true
  validates :login,                 presence: true, uniqueness: true
  validates :password,              presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
