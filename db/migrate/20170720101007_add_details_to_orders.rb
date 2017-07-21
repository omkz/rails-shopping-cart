class AddDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :email, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :pay_type, :string
    add_column :orders, :address, :text
    add_reference :orders, :user, index: true
  end
end
