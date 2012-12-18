module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "MindTribe"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  #def logo
  #    image_tag("MindTribeLogo.png", :alt => "MindTribe", :class => "round")
  #end

end
