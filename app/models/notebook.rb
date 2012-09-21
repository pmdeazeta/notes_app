class Notebook < ActiveRecord::Base
  attr_accessible :name
  has_many :notes, :dependent => :delete_all
end
