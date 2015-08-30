# app/controllers/answers_controller.rb
class AnswersController < ApplicationController

	def index
		@answers = find_question.answers
	end

	def new
	  	@answer = find_question.answers.new
	end

	def create
		@question = find_question
	  	@answer = @question.answers.new(answer_params)
	  	@question.save
	    redirect_to question_path(@question)
	end

	private 

	def find_question
		@question = Question.find(params[:question_id])
	end

	def answer_params
		params.require(:answer).permit(:body)
	end
end
