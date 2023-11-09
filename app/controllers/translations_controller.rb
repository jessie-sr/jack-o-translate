class TranslationsController < ApplicationController

    def index
        @translations = Translation.all
    end


    def new
        @translation = Translation.new
    end
    

    def create
        @translation = Translation.new(translation_params)
        open_ai_service = OpenAiService.new
        response = open_ai_service.translate(@translation.input_text, @translation.tone, @translation.context)
    
        # if !response
        #   #parsed_response = JSON.parse(response.body)
        #   @translation.output_text = response

          @translation.output_text = open_ai_service.translate(@translation.input_text, @translation.tone, @translation.context)
    
          if @translation.save
            redirect_to @translation
          else
            render :new
          end
        # else
        #   flash[:alert] = "There was an error with the translation service."
        #   render :new
        # end
      end
      

      def show
        @translation = Translation.find(params[:id])
      end


      private
      
      def translation_params
        params.require(:translation).permit(:input_text, :tone, :context)
      end
      
end
