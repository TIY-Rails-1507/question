# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update(question_params)
		redirect_to question_path(@question)
	end

	def new
		@question = Question.new
	end

	def create
		question = Question.create(question_params)
		redirect_to question_path(question)
	end

	def destroy 
		question = Question.find(params[:id])
		question.destroy 
		redirect_to questions_url
	end

	private 

	def question_params
		params.require(:question).permit(:title, :body)
	end

end
