ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        "Sveiki oranžiniai! Linkiu gerai praleisti laiką rašant naujus straipsnius."
      end
      br
      span class: "blank_slate" do
        "Norint pakeisti kontaktus, redaguokite šį straipsnį: ".html_safe +
        (Article.footer_article ? link_to(Article.footer_title, edit_admin_article_path(Article.footer_article)) : "sukurkit straipsnį pavadinimu " + Article.footer_title + "!")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
