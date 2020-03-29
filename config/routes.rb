Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :consumers, :serviceproviders
      # get '/', to: proc { [200, {}, ['']] }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
