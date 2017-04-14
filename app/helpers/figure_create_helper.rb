require_relative 'figure_helper'
class FigureSaveHelper < FigureHelper

  def complete_creation params
    add_collections params
    add_newbeis params
    @figure.save
  end

  def add_collections params
    landmarks = params[:figure][:landmark_ids] || {}
    titles    = params[:figure][:title_ids] || {}
    add_landmarks(landmarks) unless landmarks.empty?
    add_titles(titles)       unless titles.empty?
  end

end
