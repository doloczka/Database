class Student < ActiveRecord::Base
  belongs_to :grupy , class_name: "Grupy"
  has_one :wykladowca, :through => :grupy

end
