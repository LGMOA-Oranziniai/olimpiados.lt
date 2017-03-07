ActiveAdmin.register Link do
  permit_params :name, :url, :visible

  index do
    id_column
    column :name
    column :url
    column  "Visible" do |link|
      a href: toggle_visibility_admin_link_path(link), :"data-method" => :put do
        status_tag link.visible
      end
    end
    actions
  end

  member_action :toggle_visibility, finder: :find_by_slug, method: :put do
    resource.update(visible: !resource.visible)
    redirect_to collection_url, notice: !resource.visible ? "Hidden" : "Shown"
  end
end