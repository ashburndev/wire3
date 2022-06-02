class CreateDigestedData < ActiveRecord::Migration[7.0]
  def change
    create_table :digested_data do |t|
      t.binary :data
      t.string :md5

      t.timestamps
    end
  end
end
