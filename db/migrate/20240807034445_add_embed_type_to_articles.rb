class AddEmbedTypeToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :embed_type, :string
  end
end
