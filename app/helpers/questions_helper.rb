module QuestionsHelper
	def format_body(question)
		if (question.body.present?)
			truncate(question.body, length: 20, separator: ' ')
		else
			'n/a'
		end
	end
end
