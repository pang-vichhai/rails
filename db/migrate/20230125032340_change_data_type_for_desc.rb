class ChangeDataTypeForDesc < ActiveRecord::Migration[6.0]
    def change
      change_column(:articles, :desc, :text)
  end
end
