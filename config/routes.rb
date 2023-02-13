Rails.application.routes.draw do
  get 'my/:id/generate_pdf', to: 'my#show', as: :generate_pdf_my
  get 'my', to: 'my#index'
end
