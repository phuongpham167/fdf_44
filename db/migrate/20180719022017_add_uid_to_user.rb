class AddUidToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :AddProdiverToUser, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :integer
  end
end
