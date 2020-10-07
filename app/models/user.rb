class User < ApplicationRecord
    resources :posts, only: [:index, :new]
end
