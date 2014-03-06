class Availability < ActiveRecord::Base

	belongs_to :branch
	belongs_to :coupon
	has_many :choosen_questions
	has_many :surveys, through: :choosen_questions

end