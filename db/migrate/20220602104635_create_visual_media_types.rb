class CreateVisualMediaTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :visual_media_types do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
