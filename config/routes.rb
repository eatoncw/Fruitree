Rails.application.routes.draw do

	resources :products
	
	get 'static/landingpage'
	root 'static#landingpage'
end
