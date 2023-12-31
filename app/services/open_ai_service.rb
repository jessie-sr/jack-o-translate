require 'ruby/openai'

class OpenAiService

  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def translate(text, language, tone, context)
    
    response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: create_prompt(text, language, tone, context)}],
            temperature: 0.7,
        }
    ).dig("choices", 0, "message", "content")

    # If you want to check the response success here and log errors, you could add:
    # unless response.success?
    #   Rails.logger.error "OpenAI Service Error: #{response.code} #{response.message}"
    #   return nil

  rescue StandardError => e
    Rails.logger.error "OpenAI Service Error: #{e.message}"
    nil
  end

  private

  def create_prompt(text, language, tone, context)
    # Customize the prompt based on the tone and context
    "Translate #{text} to #{language}. I wanna sound #{tone.downcase}. The context of the conversation is '#{context.downcase}'. Try to sound like a native speaker!"
  end
end
