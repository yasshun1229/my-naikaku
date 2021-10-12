class User < ApplicationRecord
  before_save { self.email.downcase!} # 文字を全て、小文字から大文字に変換
  validates :name, presence: true, length: { maximum: 50 } # ユーザの名前は、カラ禁止の50字以内
  validates :email, presence: true, length: { maximum: 255 }, # Eメールは、カラ禁止の255字以内
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } # Eメールの重複禁止
  has_secure_password
end
