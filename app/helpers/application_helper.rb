module ApplicationHelper
  def image_for_name(block)
    name =/\{\%image (.*?)\%\}/.match(block)[1]
    if Image.find_by_name(name)
      img = image_tag Image.find_by_name(name).file.url
      img = '<a href="' + Image.find_by_name(name).file.url + '" data-lightbox="' + name + '">' + img + '</a>'
    else
      img = ""
    end
  end

  def markdown(text)
    text = "" if not text
    
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true,
      no_intraemphasis: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    html = markdown.render(text)
    html = html.gsub(/\{\%image (.*?)\%\}/) {|m| image_for_name(m) }
    html.html_safe
  end

  def get_categories
   Category.only_visible
  end

  def get_sponsors
   Sponsor.only_visible
  end

  def get_links
   Link.only_visible
  end
end
