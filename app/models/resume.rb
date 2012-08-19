class Resume < ActiveRecord::Base
  has_many :projects, :dependent => :destroy
  accepts_nested_attributes_for :projects, :allow_destroy => true

  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
