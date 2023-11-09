class AddOutputTextToTranslations < ActiveRecord::Migration[7.0]
  def change
    add_column :translations, :output_text, :text
  end
end
