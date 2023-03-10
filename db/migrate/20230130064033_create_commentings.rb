class CreateCommentings < ActiveRecord::Migration[6.0]
  def change
    create_table :commentings do |t|
      t.text :content
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
