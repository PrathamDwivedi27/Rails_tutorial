#email : string
#password_digest : string

# password : string virtual -> ye automatically ban jaayega because of password_digest
# password_confirmation : string virtual
# has_secure_password automatically password and password_confirmation ko match karega aur password ko hash karke password_digest mein dall dega


class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end
