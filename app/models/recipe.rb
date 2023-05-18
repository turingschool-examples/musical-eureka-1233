class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
end