class Pizza < ActiveRecord::Migration
  def change
  	create_table :pizzas do |t|
  		t.string	:size
  		t.string	:crust
  		t.string	:sauce
  		t.text	:toppings
  		t.string	:cheese

  		t.timestamps
  	end
  end
end
