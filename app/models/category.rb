class Category < ApplicationRecord
  scope :ordered, -> { order(:name) }
end
