class User < ApplicationRecord
  before_save { self.email.downcase! } # 文字を全て、小文字から大文字に変換
  validates :name, presence: true, length: { maximum: 50 } # ユーザの名前は、カラ禁止の50字以内
  validates :email, presence: true, length: { maximum: 255 }, # Eメールは、カラ禁止の255字以内
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } # Eメールの重複禁止
  has_secure_password
  
  has_many :cabinets
  has_many :favorites
  has_many :likings, through: :favorites, source: :cabinet
  # throughはモデル、sourceはどこから取得するか
  
  def like(other_cabinet) 
    self.favorites.find_or_create_by(cabinet_id: other_cabinet.id) # お気に入りの重複対策
  end
  
  def unlike(other_cabinet) 
    like = self.favorites.find_by(cabinet_id: other_cabinet.id) # お気に入り登録済みならば外す
    like.destroy if like # 中間テーブルからも消す
  end
  
  def liking?(other_cabinet)
    self.likings.include?(other_cabinet) # お気に入り登録しているcabinetを取得し、お気に入りではないcabinetが含まれていないか確認
  end
end
