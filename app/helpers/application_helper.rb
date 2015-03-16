module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  
  def markdown_to_html(markdown)
  renderer = Redcarpet::Render::HTML.new
  extensions = {fenced_code_blocks: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render markdown).html_safe
  end
  
  def will_paginate(results)
    # link_to "Prev", "?page=1"
    # link_to "Next", "?page=2"
    #raw "<a href='?page=0'>Previous</a>" "<a href='?page=1'> Next</a>"
    
    raw"<a href='?page=0'>Prev</a>
     <a href='?page=1'>1</a> 
    <a href='?page=2'>2</a>  
    <a href='?page=3'>3</a> 
    <a href='?page=4'>4</a>
    <a href='?page=5'>Next</a>"
   
    

  end 
end
