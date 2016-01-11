class Wykladowca < ActiveRecord::Base
    has_many :grupies , class_name: "Grupy"
    has_many :students, :through => :grupies
end
