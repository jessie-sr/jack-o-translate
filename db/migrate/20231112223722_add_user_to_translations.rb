class AddUserToTranslations < ActiveRecord::Migration[7.0]
  def change
    add_reference :translations, :user, null: false, foreign_key: true
  end
end
