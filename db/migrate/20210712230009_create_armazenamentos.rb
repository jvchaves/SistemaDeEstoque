class CreateArmazenamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :armazenamentos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
