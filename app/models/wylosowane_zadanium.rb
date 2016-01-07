class WylosowaneZadanium < ActiveRecord::Base
  belongs_to :student
  belongs_to :zadania_glowne
end
