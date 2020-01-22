Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :texts do
        resources :answer_sheets, shallow: true do
          resources :answers, only: [:index, :create]
        end
      end
    end
  end
end
