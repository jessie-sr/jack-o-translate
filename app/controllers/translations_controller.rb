class TranslationsController < ApplicationController

    before_action :authenticate_user!

    def index
        @translations = current_user.translations
    end


    def new
        @translation = Translation.new
    end
    

    def create
        @translation = current_user.translations.new(translation_params)
        open_ai_service = OpenAiService.new
        # response = open_ai_service.translate(@translation.input_text, @translation.tone, @translation.context)
    
        # if !response
        #   @translation.output_text = response

        # -------correct API call-------

        @translation.output_text = open_ai_service.translate(@translation.input_text, @translation.language, @translation.tone, @translation.context)
        
        #@translation.output_text = "Jack is busying working on other stuff now! Will be back soon 🎃"

          if @translation.save
            redirect_to @translation
          else
            render :new
          end

        # ----------------------------

        # else
        #   flash[:alert] = "There was an error with the translation service."
        #   render :new
        # end
      end
      

      def show
        @translation = current_user.translations.find(params[:id])
      end

      def destroy
        @translation = current_user.translations.find(params[:id])
        @translation.destroy
        flash[:notice] = "Translation '#{@translation.input_text}' deleted."
        redirect_to translations_path
      end

      private
      
      def translation_params
        params.require(:translation).permit(:input_text, :language, :tone, :context)
      end
      
end
