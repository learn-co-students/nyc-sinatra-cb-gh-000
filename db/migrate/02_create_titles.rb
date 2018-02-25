class CreateTitles < ActiveRecord::Migration[5.1]

  def up
    create_table :titles do |t|
      t.string :name
    end
  end

  def down
    destroy_table :titles
  end

end