class AddMainCategoryToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :main_category, :boolean, default: false
  end
end
