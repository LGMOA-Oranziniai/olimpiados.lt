ActiveAdmin.register Article do
  belongs_to :category, optional: true

  permit_params :category_id, :title, :slug, :content

  index do
    column :id
    column "Name" do |article|
      link_to article.title, admin_article_path(article)
    end
    column :created_at
    # column "Category" do |article|
    #   link_to article.category.name, admin_category_a_path(article.category) if article.category
    # end
    actions
  end

  show do |a|
    div class: "content" do
      h5 a.id
      h2 a.title
      article markdown(a.content)
    end
  end

end
