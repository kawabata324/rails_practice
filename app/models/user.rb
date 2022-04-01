class User < ApplicationRecord
  # 右式はselfを省略できる
  before_save { email.downcase! }
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            # INFO Mysqlではデフォルトで大文字小文字の区別はないが、他のデータベースを使用する可能性もあるので考慮する
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
