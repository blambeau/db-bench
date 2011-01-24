require File.expand_path('../commons.rb', __FILE__)
logto("install")
ActiveRecord::Schema.define do

  create_table :albums, :force => true do |table|
    table.column :title,     :string
    table.column :performer, :string
  end

  create_table :tracks, :force => true do |table|
    table.column :album_id, :integer
    table.column :position, :integer
    table.column :title,    :string
    table.column :votes,    :integer
  end
  
  add_index :tracks, [:album_id], :name => "index_albums_on_album_id"
  
end
