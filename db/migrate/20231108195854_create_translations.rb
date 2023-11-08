class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.text :input_text
      t.text :output_text
      t.string :tone
      t.string :context

      t.timestamps
    end
  end
end
