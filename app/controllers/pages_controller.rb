class PagesController < ApplicationController
	def index
	end

	def order
		@pizza = Pizza.new
		@size = %w(small medium large)
		@crust = %w(regular thin garlic thick)
		@sauce = %w(marinara white barbecue)
	end

	def toppings
		@pizza = Pizza.new pizza_params
		@pizza.save(validate: false)
		@cheese = %w(normal extra none)
		@toppings = %w(pepperoni sausage bacon peppers olives jalapenos)
	end

	def delivery
		@pizza = Pizza.find params[:id]
		@pizza.update_attributes(pizza_params)
		@price = @pizza.price
	end

	private
		def pizza_params
			params.require(:pizza).permit(:size, :crust, :sauce, :cheese, :toppings => [ ])
		end

end