require_relative 'figure_helper'
class FigureUpdateHelper < FigureHelper

  def update params
    update_name_if_changed params[:figure][:name]
    update_collections_if_changed params
    add_newbeis params
    @figure.save
  end

  def update_name_if_changed name
    @figure.name = name unless @figure.name == name
  end

  def update_collections_if_changed params
    unless @figure.titles == params[:figure][:title_ids]
      update_titles params[:figure][:title_ids]
    end
    unless @figure.landmarks == params[:figure][:landmark_ids]
      update_landmarks params[:figure][:landmark_ids]
    end
  end

  def update_landmarks landmark_ids
    @figure.landmark_ids.clear
    @figure.landmark_ids = landmark_ids
    @figure.landmarks.clear
    add_landmarks(landmark_ids) if landmark_ids
  end

  def update_titles title_ids
    @figure.title_ids.clear
    @figure.title_ids = title_ids
    @figure.titles.clear
    add_titles(title_ids) if title_ids
  end

end
