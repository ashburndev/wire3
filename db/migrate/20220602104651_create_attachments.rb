class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :title
      t.boolean :visible
      t.bigint :position
      t.bigint :file_size
      t.string :caption, limit: 1000
      t.string :type
      t.references :document, null: false, foreign_key: true
      t.references :binary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
