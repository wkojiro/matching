class AddcolumeToResumes2 < ActiveRecord::Migration
  def change
        add_column :resumes, :skillexperience_futsu, :text
        add_column :resumes, :skillexperience_taxi, :text
        add_column :resumes, :skillexperience_haier, :text         
        add_column :resumes, :skillexperience_rosenbus, :text
        add_column :resumes, :skillexperience_ryokyakubus, :text
        add_column :resumes, :skillexperience_sonotabus, :text        
        add_column :resumes, :skillexperience_kenin, :text         
        add_column :resumes, :skillexperience_oogatatruck, :text   
        add_column :resumes, :skillexperience_chugatatruck, :text 
        add_column :resumes, :skillexperience_kogatatruck, :text 
        add_column :resumes, :skillexperience_tokusyu, :text 
        add_column :resumes, :skillexperience_sonota01, :text  
        add_column :resumes, :skillexperience_sonota02, :text          
  end
end
