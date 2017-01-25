Rails.application.routes.draw do
 devise_for :users
 
 resources :users do
    member do
      get :following, :followers
    end
  end

 resources :posts do
 	member do
 		get 'like', to: 'posts#upvote'
 		get 'dislike' , to: 'posts#downvote'
 	 end
 	resources :comments
 end

get '/blogs' , to: 'posts#index'
get '/mystory', to: 'posts#display'
resources :aims do
	resources :progresses do
		resources :progress_comments
	end
end

resources :relationships,  only: [:create, :destroy]
 root 'progresses#index'
 
end
