class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :user, index: true
      t.references :campaign, index: true
      t.string :message # ここではとりあえず一言メッセージをクライアント側に見せられるようにしてみた。ここに残すべきかどうかは不明。本当は別にメッセージモデルを作って、、。ネスト系のにおいがするけど。。。
      
      t.timestamps null: false
      t.index [:user_id, :campaign_id] # この行を追加 同じ人が何度も同じ案件に応募しないってことかな。Uniqueがある必要性は不明且つ。メッセージのやり取りをやることを考えるとUniqueにしない方が良いかなと。。
    end
  end
end
