GolfChallengeRailsBackend::Application.routes.draw do
  resources :countries, :only => [:index, :show]

  resources :bracket_golfers

  resources :golfer_achievements

  resources :achievements

  resources :brackets

  resources :golfers, :only => [:index, :show]
end
