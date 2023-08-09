#app/components/dialog_component.rb

# Handles the processing of chat entries in a conversation using an AI integration component.
# Creates a new AI response associated with the chat entry.
# Updates the chat entry to reference the AI response.
class DialogComponent
  def initialize
    @ai_integration_component = AiIntegrationComponent.new
  end

  def process_chat_entry(conversation, chat_entry)
    ai_response = @ai_integration_component.generate_ai_response(conversation, chat_entry.content)

    ai_response_content = ai_response[:content]
    original_text_id    = ai_response[:original_text_id]

    ai_response = AiResponse.create(conversation: conversation, chat_entry: chat_entry, content: ai_response_content, original_text_id: original_text_id)
    
    chat_entry.update(ai_response_id: ai_response.id)
  end
end