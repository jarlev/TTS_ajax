class Pizza < ActiveRecord::Base
	serialize :toppings, Array
	belongs_to :user
	validates :size, presence: true, inclusion: {in: %w(small medium large)}
	validates :crust, presence: true, inclusion: {in: %w(regular thin garlic thick)}
	validates :sauce, presence: true, inclusion: {in: %w(marinara white barbecue)}
	validates :cheese, presence: true, inclusion: {in: %w(normal extra none)}
	# validates :toppings, presence: true, inclusion: {in: %w(jalapenos sausage bacon peppers olives pepperoni)}

	def price
		case size
		when "small"
			price = 5
		when "medium"
			price = 7
		when "large"
			price = 9
		end
		price = toppings_price + price
	end

	def toppings_price
		topping_price = toppings.count - 1
	end

end