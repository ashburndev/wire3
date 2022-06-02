class CreateCarrierWaveFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :carrier_wave_files do |t|
      t.binary :data
      t.string :identifier
      t.string :original_filename
      t.string :content_type
      t.string :extension
      t.bigint :size

      t.timestamps
    end
  end
end
