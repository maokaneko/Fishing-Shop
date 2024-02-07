Rails.application.routes.draw do
  root "products#index"

  # 商品詳細ページ
  resources :products, only: [:show]

  resources :line_items, only: %i[create destroy]

  resources :carts, only: [:index]

end
