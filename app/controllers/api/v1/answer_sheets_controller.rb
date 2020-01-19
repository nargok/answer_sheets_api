module Api
  module V1
    class AnswerSheetsController < ApplicationController
      before_action :set_answer_sheet, only: [:show, :update ,:destroy]

      def index
        answer_sheets = AnswerSheet.where(text_id: params[:text_id]).order(created_at: :desc)
        render json: { status: 'success', message: 'Loaded answer_sheets', data: answer_sheets }
      end

      def show
        render json: { status: 'success', message: 'Loaded the text', data: @answer_sheet }
      end

      def create
        answer_sheet = AnswerSheet.new(answer_sheet_params)
        if answer_sheet.save
          render json: { status: 'success', data: answer_sheet }
        else
          render json: { status: 'ERROR', data: answer_sheet.errors }
        end
      end

      def update
        if @answer_sheet.update(answer_sheet_params)
          render json: { status: 'success', message: 'Updated the text', data: @answer_sheet }
        else
          render json: { status: 'ERROR', message: 'Not updated', data: @answer_sheet.errors }
        end
      end

      def destroy
        @answer_sheet.destroy
        render json: { status: 'SECCESS', message: 'Deleted the text', data: @answer_sheet }
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
