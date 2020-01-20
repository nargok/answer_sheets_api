module Api
  module V1
    class AnswerSheetsController < ApplicationController
      before_action :set_answer_sheet, only: [:show, :update ,:destroy]
      include ResponseGenerator

      def index
        answer_sheets = AnswerSheet.where(text_id: params[:text_id]).order(created_at: :desc)
        index_data('answer_sheets', answer_sheets)
      end

      def show
        show_data('answer_sheet', @answer_sheet)
      end

      def create
        answer_sheet = AnswerSheet.new(answer_sheet_params)
        text = Text.find_by(id: params[:text_id])
        answer_sheet.text = text
        if answer_sheet.save
          create_success('answer_sheet', answer_sheet)
        else
          create_error(answer_sheet.errors)
        end
      end

      def update
        if @answer_sheet.update(answer_sheet_params)
          update_success('answer_sheet', @answer_sheet)
        else
          update_error(@answer_sheet.errors)
        end
      end

      def destroy
        @answer_sheet.destroy
        destroy_data('answer_sheet', @answer_sheet)
      end

      private

      def set_answer_sheet
        @answer_sheet = AnswerSheet.find(params[:id])
      end

      def answer_sheet_params
        params.require(:answer_sheet).permit(:description)
      end

    end
  end
end
