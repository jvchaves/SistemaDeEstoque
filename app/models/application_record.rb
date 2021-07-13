class ApplicationRecord < ActiveRecord::Base
  require 'pry'
  self.abstract_class = true
end
