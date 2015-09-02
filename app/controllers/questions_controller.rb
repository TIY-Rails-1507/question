# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController

	def index
		@all_questions = Question.all
		@answered_questions = Question.with_answers
		@unanswered_questions = Question.without_answers
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			flash[:notice] = "The question was updated"
			redirect_to question_path(@question)
		else
			render :edit
		end
	end

	def new
		@question = Question.new
	end

	def create
		
		@question = Question.new(question_params)
		
		if(@question.save)
			redirect_to question_path(@question)
		else
			render :new
		end
	end

	def destroy 
		question = Question.find(params[:id])
		question.destroy 
		flash[:notice] = "The question was deleted"
		redirect_to questions_url
	end

	private 

	def question_params
		params.require(:question).permit(:title, :body)
	end

end
