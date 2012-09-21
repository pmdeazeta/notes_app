class Note < ActiveRecord::Base
  attr_accessible :message, :name, :notebook_id
  belongs_to :notebook
end
