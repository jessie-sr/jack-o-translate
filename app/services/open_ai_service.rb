require 'ruby/openai'

class OpenAiService

  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def translate(text, tone, context)
    
    response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: create_prompt(text, tone, context)}],
            temperature: 0.7,
        }
    ).dig("choices", 0, "message", "content")

    # response = @client.chat(
    # parameters: {
    #     model: "gpt-3.5-turbo", # Required.
    #     messages: [{ role: "user", content: "Hello, my name is Banura. how are you?"}], # Required.
    #     temperature: 0.7,
    # })

    # If you want to check the response success here and log errors, you could add:
    # unless response.success?
    #   Rails.logger.error "OpenAI Service Error: #{response.code} #{response.message}"
    #   return nil

  rescue StandardError => e
    Rails.logger.error "OpenAI Service Error: #{e.message}"
    nil
  end

  private

  def create_prompt(text, tone, context)
    # Customize the prompt based on the tone and context
    "Translate #{text} to English with a #{tone.downcase} tone and #{context.downcase} context."
  end
end
