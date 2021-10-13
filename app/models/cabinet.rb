class Cabinet < ApplicationRecord
  belongs_to :user
  
  with_options presence: true, length: { maximum: 50 } do # カラ禁止、50字以内
    validates :title_cabinet # 内閣の名前
  
    validates :prime_minister_name # 総理大臣
    validates :chief_cabinet_secretary_name # 内閣官房長官
    validates :finance_minister_name # 財務大臣
    validates :comprehensive_minister_name # 総務大臣
    validates :economy_minister_name # 経済産業大臣
    validates :education_minister_name # 文部科学大臣
    validates :welfare_minister_name # 厚生労働大臣
    validates :diplomacy_minister_name # 外務大臣
    validates :defense_minister_name # 防衛大臣
    validates :agriculture_minister_name # 農林水産大臣
    validates :traffic_minister_name # 国土交通大臣
    validates :law_minister_name # 法務大臣
    validates :green_minister_name # 環境大臣
    validates :digital_minister_name # デジタル大臣
    validates :reconstruction_minister_name # 復興大臣
    validates :public_security_minister_name # 国家公安委員長
  end
end