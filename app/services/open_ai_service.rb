require 'httparty'

class OpenAiService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize
    @options = {
      headers: {
        'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}",
        'Content-Type' => 'application/json'
      }
    }
  end

  def translate(text, tone, context)
    body = {
      prompt: create_prompt(text, tone, context),
      max_tokens: 60  # You can adjust the max tokens as needed
    }.to_json
    
    @options[:body] = body
    self.class.post('/engines/davinci-codex/completions', @options)
  end

  private

  def create_prompt(text, tone, context)
    # Customize the prompt based on the tone and context
    "Translate this text with a #{tone.downcase} tone and #{context.downcase} context: #{text}"
  end
end
