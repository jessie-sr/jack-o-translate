# frozen_string_literal: true

class AddLanguageToTranslations < ActiveRecord::Migration[7.0]
  def change
    add_column :translations, :language, :string
  end
end
