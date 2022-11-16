Rails.application.routes.draw do
  namespace :crm do
    devise_for :admin_users, skip: :registrations, controllers: {
      sessions: 'crm/sessions',
      passwords: 'crm/passwords',
      confirmations: 'crm/confirmations'
    }
  
    devise_scope :admin_users do
      # devise_forで定義すると不要なedit/destroyまで生成されてしまうので個別に定義する
      resource :registration, only: [:new, :create]
    end
  end
end
