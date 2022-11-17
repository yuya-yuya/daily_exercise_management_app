Rails.application.routes.draw do
  namespace :crm do
    root to: 'homes#top'

    devise_for :admin_users, module: :devise, skip: :registrations, controllers: {
      sessions: 'crm/admin_users/sessions',
      passwords: 'crm/admin_users/passwords',
      confirmations: 'crm/admin_users/confirmations'
    }

    namespace :admin_users do
      devise_scope :admin_users do
        # devise_forで定義すると不要なedit/destroyまで生成されてしまうので個別に定義する
        resource :registration, only: [:new, :create], path: '/users', controller: :registrations
      end
    end

    resources :admin_users
  end
end
