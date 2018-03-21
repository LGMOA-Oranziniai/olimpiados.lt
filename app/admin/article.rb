ActiveAdmin.register Article do
  controller do
    defaults finder: :find_by_slug

    def toggle_visibility

    end
  end
  
  belongs_to :category, optional: true, finder: :find_by_slug

  permit_params :category_id, :title, :slug, :content, :visibility

  index do
    column :id
    column "Category" do |article|
      link_to article.category.name, admin_category_articles_path(article.category) if article.category
    end
    column "Name" do |article|
      link_to article.title, admin_article_path(article)
    end
    column  "Visible" do |article|
      a href: toggle_visibility_admin_article_path(article), :"data-method" => :put do
        status_tag article.visible
      end
    end
    column :created_at
    actions
  end

  show do |a|
    div class: "content" do
      h5 a.id
      h2 a.title
      article markdown(a.content)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :title
      if !f.object.new_record?
        input :slug
      end
      input :category
      input :content
    end
    f.actions
  end

   member_action :toggle_visibility, finder: :find_by_slug, method: :put do
    resource.update(visible: !resource.visible)
    redirect_to collection_url, notice: !resource.visible ? "Hidden" : "Shown"
  end
end
