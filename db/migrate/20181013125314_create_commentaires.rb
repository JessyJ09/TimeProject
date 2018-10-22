class CreateCommentaires < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaires do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :publication, foreign_key: true
      t.string :position

      t.timestamps
    end
  end
end
