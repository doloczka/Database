class Rozwiazanium < ActiveRecord::Base
  belongs_to :wykladowca
  belongs_to :student
end
