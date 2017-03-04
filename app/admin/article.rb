ActiveAdmin.register Article do
  controller do
    defaults finder: :find_by_slug
  end
  
  belongs_to :category, optional: true, finder: :find_by_slug

  permit_params :category_id, :title, :slug, :content

  index do
    column :id
    column "Name" do |article|
      link_to article.title, admin_article_path(article)
    end
    column :created_at
    column "Category" do |article|
      link_to article.category.name, admin_category_articles_path(article.category) if article.category
    end
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
      input :slug
      input :content
    end
    f.actions
  end

end
