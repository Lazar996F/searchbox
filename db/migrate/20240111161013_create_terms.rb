class CreateTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :terms do |t|
      t.string :query
      t.string :ip_address

      t.timestamps
    end
  end
end
