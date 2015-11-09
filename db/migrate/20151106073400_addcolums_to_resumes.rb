class AddcolumsToResumes < ActiveRecord::Migration
  def change
    # カラム名変更
    rename_column :categories, :genre, :genre1
    rename_column :campaigns, :offce_name, :office_name
    rename_column :campaigns, :offce_postel, :office_postel
    rename_column :campaigns, :offce_postel02, :office_postel02
    rename_column :campaigns, :offce_address01, :office_address01
    rename_column :campaigns, :offce_address02, :office_address02
    rename_column :campaigns, :offce_address03, :office_address03
    rename_column :campaigns, :offce_address04, :office_address04
    rename_column :resumes, :address1, :user_address01
    rename_column :resumes, :address2, :user_address02

    # カラム追加(campaigns)
    add_column :campaigns, :howmany, :text, :after => :mycar
    add_column :campaigns, :shouyo, :text, :after => :promote

    # カラム追加(categories)
    add_column :categories, :genre2, :text

    # カラム追加(clients)
    add_column :clients, :compnamefurigana, :text, :after => :compname
    add_column :clients, :honsya_postel, :text
    add_column :clients, :honsya_postel02, :text
    add_column :clients, :honsya_addres01, :text
    add_column :clients, :honsya_addres02, :text
    add_column :clients, :honsya_addres03, :text
    add_column :clients, :honsya_addres04, :text
    add_column :clients, :honsya_tel, :text
    add_column :clients, :honsya_fax, :text
    add_column :clients, :honsya_url, :text
    add_column :clients, :daihyou, :text
    add_column :clients, :since, :text
    add_column :clients, :capital, :text
    add_column :clients, :employee, :text
    add_column :clients, :gyousyu, :text
    add_column :clients, :business, :text
    add_column :clients, :bikou, :text
    add_column :clients, :membernamefurigana, :text, :after => :membername
    add_column :clients, :section, :text
    add_column :clients, :position, :text
    add_column :clients, :membercomp, :text
    add_column :clients, :memberpostel, :text
    add_column :clients, :memberpostel02, :text
    add_column :clients, :memberaddress01, :text
    add_column :clients, :memberaddress02, :text
    add_column :clients, :memberaddress03, :text
    add_column :clients, :memberaddress04, :text
    add_column :clients, :membertel, :text
    add_column :clients, :memberfax, :text
    add_column :clients, :agreeflg, :text

    # カラム追加(users)
    add_column :users, :namaefurigana, :text, :after => :name

    # カラム追加(resumes)
    add_column :resumes, :user_address03, :text
    add_column :resumes, :user_address04, :text
    add_column :resumes, :user_postel01, :text
    add_column :resumes, :user_postel02, :text
    add_column :resumes, :tel02, :text
    add_column :resumes, :gradyear, :text
    add_column :resumes, :gradschool, :text
    add_column :resumes, :status, :text
    add_column :resumes, :jikopr, :text
    add_column :resumes, :graduateyear, :text
    add_column :resumes, :skills, :text
    add_column :resumes, :wannabe, :text
    add_column :resumes, :scoutflg, :text
    add_column :resumes, :jobhopcount, :text    
    add_column :resumes, :jobhistorycompname01, :text
    add_column :resumes, :jobhistorystartdate01, :text
    add_column :resumes, :jobhistoryenddate01, :text
    add_column :resumes, :jobhistorykeitai01, :text
    add_column :resumes, :jobhistoryoccupation01, :text
    add_column :resumes, :jobhistory01, :text
    add_column :resumes, :jobhistorycompname02, :text
    add_column :resumes, :jobhistorystartdate02, :text
    add_column :resumes, :jobhistoryenddate02, :text
    add_column :resumes, :jobhistorykeitai02, :text
    add_column :resumes, :jobhistoryoccupation02, :text
    add_column :resumes, :jobhistory02, :text
    add_column :resumes, :jobhistorycompname03, :text
    add_column :resumes, :jobhistorystartdate03, :text
    add_column :resumes, :jobhistoryenddate03, :text
    add_column :resumes, :jobhistorykeitai03, :text
    add_column :resumes, :jobhistoryoccupation03, :text
    add_column :resumes, :jobhistory03, :text
    add_column :resumes, :skillexperience, :text    
  end
end
