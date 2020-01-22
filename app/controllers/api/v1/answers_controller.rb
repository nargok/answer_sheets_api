module Api
  module V1
    class AnswersController < ApplicationController
      include ResponseGenerator

      def index
        answers = Answer.where(answer_sheet_id: params[:answer_sheet_id]).order(answer_no: :asc)
        index_data('answers', answers)
      end

      def create
        now = Time.zone.now
        answer_sheet = AnswerSheet.find_by(id: params[:answer_sheet_id])
        answers = []
        answers_params.each do |answer|
          answer[:answer_sheet_id] = answer_sheet.id
          answer[:created_at] = now
          answer[:updated_at] = now
          answers << answer
        end
        if Answer.insert_all(answers)
          create_success('answers', answers)
        else
          create_error('Answers was not saved correctly.')
        end
      end

      private

      def answers_params
        params.require(:answers).map { |a| a.permit(:answer_no, :answer, :answer_type_id)}
      end

    end
  end
end
