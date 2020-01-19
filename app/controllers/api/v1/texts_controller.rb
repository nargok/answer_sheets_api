module Api
  module V1
    class TextsController < ApplicationController
      before_action :set_text, only: [:show, :update ,:destroy]
      include ResponseGenerator

      def index
        texts = Text.order(created_at: :desc)
        index_data('texts', texts)
      end

      def show
        show_data('text', @text)
      end

      def create
        text = Text.new(text_params)
        if text.save
          create_success('text', text)
        else
          create_error(text.errors)
        end
      end

      def update
        if @text.update(text_params)
          update_success('text', @text)
        else
          update_error(@text.errors)
        end
      end

      def destroy
        @text.destroy
        destroy_data('text', @text)
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
