class Locale < ActiveRecord::Base
  attr_accessible :localename, :localetype, :parent
end
