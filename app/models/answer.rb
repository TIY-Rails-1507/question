# app/models/answer.rb
class Answer < ActiveRecord::Base
  belongs_to :question
end
