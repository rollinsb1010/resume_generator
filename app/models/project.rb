class Project < ActiveRecord::Base
  acts_as_taggable_on :technologies

end