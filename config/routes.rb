ResumeGenerator::Application.routes.draw do


  resources :resumes
  resources :projects, :only => [] do
    get :autocomplete_technology_name, :on => :collection
  end

  root :to => redirect("/resumes")

end
