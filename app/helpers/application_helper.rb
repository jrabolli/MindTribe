module ApplicationHelper
  #Return a title on a  per-page basis
  def title
    base_title = "MindTribe"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
      image_tag("MindTribeLogo.png", :alt => "MindTribe", :class => "round")
  end

end
