class ZadaniaPoboczne < ActiveRecord::Base
  belongs_to :wykladowca
  belongs_to :grupy
end
