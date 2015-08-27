# app/models/question.rb
class Question < ActiveRecord::Base
	has_many :answers
end
