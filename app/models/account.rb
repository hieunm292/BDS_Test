class Account < ApplicationRecord

    before_save :downcase_email

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: { maximum: 250 }
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password

    private

    def downcase_email
        email.downcase!
    end
end
