class AddDescToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :desc, :string
  end
end
