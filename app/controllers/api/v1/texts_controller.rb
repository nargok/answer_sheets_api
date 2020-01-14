module Api
  module V1
    class TextsController < ApplicationController
      before_action :set_text, only: [:show, :update ,:destroy]

      def index
        texts = Text.order(created_at: :desc)
        render json: { status: 'success', message: 'Loaded texts', data: texts }
      end

      def show
        render json: { status: 'success', message: 'Loaded the text', data: @text }
      end

      def create
        text = Text.new(text_params)
        if text.save
          render json: { status: 'success', data: text }
        else
          render json: { status: 'ERROR', data: text.errors }
        end
      end

      def update
        if @text.update(text_params)
          render json: { status: 'success', message: 'Updated the text', data: @text }
        else
          render json: { status: 'ERROR', message: 'Not updated', data: @text.errors }
        end
      end

      def destroy
        @text.destroy
        render json: { status: 'SECCESS', message: 'Deleted the text', data: @text }
      end

      private

      def set_text
        @text = Text.find(params[:id])
      end

      def text_params
        params.require(:text).permit(:title)
      end

    end
  end
end
