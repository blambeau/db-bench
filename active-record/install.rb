require File.expand_path('../commons.rb', __FILE__)
ActiveRecord::Schema.define do
  create_table :albums, :force => true do |table|
    table.column :title, :string
    table.column :performer, :string
  end
  create_table :tracks, :force => true do |table|
    table.column :album_id, :integer
    table.column :track_number, :integer
    table.column :title, :string
  end
end
