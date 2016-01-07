class Grupy < ActiveRecord::Base
  belongs_to :wykladowca
  has_many :students
end
