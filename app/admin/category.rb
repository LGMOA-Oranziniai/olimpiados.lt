ActiveAdmin.register Category do
  controller do
    defaults finder: :find_by_slug
  end
  
  permit_params :name, :slug, :display_name, :visible

  index do
    column :id
    column "Title" do |category|
      link_to category.name, admin_category_articles_path(category)
    end
    column  "Visible" do |category|
      a href: toggle_visibility_admin_category_path(category), :"data-method" => :put do
        status_tag category.visible
      end
    end
    column :created_at
    actions
  end

  member_action :toggle_visibility, finder: :find_by_slug, method: :put do
    resource.update(visible: !resource.visible)
    redirect_to collection_url, notice: !resource.visible ? "Hidden" : "Shown"
  end
end
