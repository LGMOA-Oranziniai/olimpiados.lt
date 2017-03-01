ActiveAdmin.register Category do
  controller do
    defaults finder: :find_by_slug
  end
  
  permit_params :name, :slug, :display_name

  index do
    column :id
    column "Title" do |category|
      link_to category.name, admin_category_articles_path(category)
    end
    column :created_at
    actions
  end

end
