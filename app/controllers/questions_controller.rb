# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def show
		question_id = params[:id]
		@question = Question.find(question_id)
	end

	def edit
		question_id = params[:id]
		@question = Question.find(question_id)
	end

end
