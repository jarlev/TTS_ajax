class User < ActiveRecord::Base
	has_many :pizzas
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true

end
