class AddSubjectToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :subject, :string
  end
end
