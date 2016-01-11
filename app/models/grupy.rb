class Grupy < ActiveRecord::Base
  belongs_to :wykladowca, class_name: "Wykladowca"
  has_many :students, class_name: "Student"
end
