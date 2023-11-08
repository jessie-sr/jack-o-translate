class TranslationsController < ApplicationController
    
    def create
        @translation = Translation.new(translation_params)
        open_ai_service = OpenAIService.new
        response = open_ai_service.translate(@translation.input_text, @translation.tone, @translation.context)
        
        if response.success?
          @translation.output_text = response.parsed_response['choices'].first['text']
          if @translation.save
            redirect_to @translation
          else
            render :new
          end
        else
          flash[:alert] = "There was an error with the translation service."
          render :new
        end
      end
      
      private
      
      def translation_params
        params.require(:translation).permit(:input_text, :tone, :context)
      end
      
end
