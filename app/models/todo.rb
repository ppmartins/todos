class Todo < ActiveRecord::Base
  validates :title, length: { minimum: 3, maximum: 75 }
end
