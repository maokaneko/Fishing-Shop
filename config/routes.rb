Rails.application.routes.draw do
  root "products#index"

  # 商品詳細ページ
  resources :products, only: [:show]

end
