class Project < ActiveRecord::Base
  belongs_to :resume

  acts_as_taggable_on :technologies

end
