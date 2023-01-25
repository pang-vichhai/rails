class AddBlogToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :blog, :text
  end
end
