class ProjectsController < ApplicationController
  autocomplete :technology, :name, :class_name => 'ActsAsTaggableOn::Tag'

end