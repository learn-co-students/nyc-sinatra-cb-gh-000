class CreateFigures < ActiveRecord::Migration[5.1]

  def up
    create_table :figures do |t|
      t.string :name
    end
  end

  def down
    destroy_table :figures
  end

end