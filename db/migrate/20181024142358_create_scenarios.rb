class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.string :title
      t.string :user_name
      t.string :file_path
      t.timestamps
    end
  end
end
