class CreateDocumentCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :document_countries do |t|
      t.string :code, limit: 5
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
