Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: {
    sessions: 'sessions',
    passwords: 'passwords',
    confirmations: 'confirmations',
  }

  devise_scope :users do
    # devise_forで定義すると不要なedit/destroyまで生成されてしまうので個別に定義する
    resource :registration, only: [:new, :create]
  end

  root to: 'homes#top'
end
