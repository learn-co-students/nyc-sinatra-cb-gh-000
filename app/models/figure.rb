class Figure < ActiveRecord::Base

  has_many :landmarks
  has_many :figuretitle
  has_many :titles, through: :figuretitle

end
