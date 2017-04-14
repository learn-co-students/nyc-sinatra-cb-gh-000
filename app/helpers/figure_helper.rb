class FigureHelper

  def initialize figure
    @figure = figure
  end

  def add_titles title_ids
    title_ids.each do |id|
      @figure.titles << Title.find(id)
    end
  end

  def add_landmarks landmark_ids
    landmark_ids.each do |id|
      @figure.landmarks << Landmark.find(id)
    end
  end

  def add_new_title title_params
    title = Title.create(title_params)
    @figure.titles << title
  end

  def add_new_landmark landmark_params
    landmark = Landmark.create(landmark_params)
    @figure.landmarks << landmark
  end

  def add_newbeis params
    landmark = params[:landmark] || {}
    title    = params[:title] || {}
    add_new_landmark(landmark) unless landmark.empty?
    add_new_title(title)       unless title.empty?
  end

  def method_missing method
    @figure.send(method)
  end

end
