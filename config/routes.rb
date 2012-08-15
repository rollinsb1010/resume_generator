ResumeGenerator::Application.routes.draw do


  resources :resumes

  root :to => redirect("/resumes")

end
