class CreateHelloworks < ActiveRecord::Migration
  def change
    create_table :helloworks do |t|
      t.string :hwnum
      t.string :hwtype
      t.string :hwjigyousyo
      t.string :hwjigyousyoaddress
      t.string :hwjigyousyoaddress02
      t.string :hwjigyousyoaddress03
      t.string :hwjigyousyoaddress04
      t.string :hwjigyousyotel
      t.string :hwjigyousyofax
      t.string :hwjigyounaiyou
      t.string :hwsyokusyu
      t.string :hwkoyoukeitai
      t.string :hwsangyo
      t.string :hwsyugyoukeitai
      t.string :hwkoyoukikan
      t.string :hwnennrei
      t.string :hwnennreiriyuu
      t.string :hwsyugyoujikan
      t.string :hwkyukeijikan
      t.string :hwjikangai
      t.string :hwroudounissuu
      t.string :hwsalarytype
      t.string :hwbonus
      t.string :hwkyujitsu
      t.string :hwsyukyu
      t.string :hwnenkankyujitsu
      t.string :hwikukyu
      t.string :hwtakuji
      t.string :hwworkplace
      t.string :hwworkplace02
      t.string :hwensen
      t.string :hwtenkin
      t.string :hwjyugyouin
      t.string :hwhoken
      t.string :hwteinen
      t.string :hwsaikoyou
      t.string :hwjyutaku
      t.string :hwmycar
      t.string :hwtsukin
      t.string :hwsaiyoninzu
      t.string :hwshigotonaiyou
      t.string :hwgakureki
      t.string :hwkeiken
      t.string :hwmenkyo
      t.string :hwtokki
      t.string :hwbikou
      t.string :hwjyuribi
      t.string :hwkigenbi
      t.string :hwjyurianteijo
      t.date :hwstartdate
      t.date :hwenddate
      t.string :hwopnflg
      t.string :hwareatag
      t.string :hwsyokusyutag
      t.string :hwkoyoukeitaitag
      t.string :hwsonotatag01
      t.string :hwsonotatag02
      
      t.timestamps null: false
    end
  end
end
