class ChangejobhistorycolumeToResumes < ActiveRecord::Migration
  # 変更内容
  def up
    change_column :resumes, :jobhistorystartdate01, :date    
    change_column :resumes, :jobhistoryenddate01, :date
    change_column :resumes, :jobhistorystartdate02, :date    
    change_column :resumes, :jobhistoryenddate02, :date
    change_column :resumes, :jobhistorystartdate03, :date    
    change_column :resumes, :jobhistoryenddate03, :date    
  end

  # 変更前の状態
  def down
    change_column :resumes, :jobhistorystartdate01, :string    
    change_column :resumes, :jobhistoryenddate01, :string
    change_column :resumes, :jobhistorystartdate02, :string    
    change_column :resumes, :jobhistoryenddate02, :string
    change_column :resumes, :jobhistorystartdate03, :string    
    change_column :resumes, :jobhistoryenddate03, :string  
  end
end
