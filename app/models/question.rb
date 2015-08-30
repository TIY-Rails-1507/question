# app/models/question.rb
class Question < ActiveRecord::Base
	has_many :answers

	validates :title, presence: true
	validates :body, length: { minimum: 10 }

	def self.without_answers
		includes(:answers).where(:answers => { :id => nil })
	end

	def self.with_answers
		includes(:answers).where.not(:answers => { :id => nil })
	end
end
