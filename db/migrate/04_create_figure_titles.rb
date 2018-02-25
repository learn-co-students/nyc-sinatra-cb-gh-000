class CreateFigureTitles < ActiveRecord::Migration[5.1]

  def up
    create_table :figure_titles do |t|
      t.integer :figure_id
    end
  end

  def down
    destroy_table :figure_titles
  end

end