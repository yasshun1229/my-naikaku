class CreateCabinets < ActiveRecord::Migration[6.1]
  def change
    create_table :cabinets do |t|
      t.string :title_cabinet # 内閣の名前

      t.string :prime_minister_name # 総理大臣
      t.string :chief_cabinet_secretary_name # 内閣官房長官
      t.string :finance_minister_name # 財務大臣
      t.string :comprehensive_minister_name # 総務大臣
      t.string :economy_minister_name # 経済産業大臣
      t.string :education_minister_name # 文部科学大臣
      t.string :welfare_minister_name # 厚生労働大臣
      t.string :diplomacy_minister_name # 外務大臣
      t.string :defense_minister_name # 防衛大臣
      t.string :agriculture_minister_name # 農林水産大臣
      t.string :traffic_minister_name # 国土交通大臣
      t.string :law_minister_name # 法務大臣
      t.string :green_minister_name # 環境大臣
      t.string :digital_minister_name # デジタル大臣
      t.string :reconstruction_minister_name # 復興大臣
      t.string :public_security_minister_name # 国家公安委員長
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
