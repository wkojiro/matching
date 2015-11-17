class ChangeGradyearTodate < ActiveRecord::Migration
  # 変更内容
  def up
    change_column :resumes, :gradyear, :date
  end

  # 変更前の状態
  def down
    change_column :resumes, :gradyear, :string
  end
end
