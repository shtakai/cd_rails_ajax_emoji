class MoodController < ApplicationController
  @@EMOJI_ULI = 'https://api.github.com/emojis'
  def index
  end

  def get_mood
    code = params[:emoji] ? params[:emoji] : ''
    agent = Mechanize.new
    result = JSON.parse agent.get(@@EMOJI_ULI).body
    @image_url = result[code.to_s]
    flash[:alert] = "I'm sorry. I could not recognize your mood. Please try again." if @image_url.blank?
  end

end
