# coding: utf-8
module ProjectDecorator
  
  def backers_count
    t('backers_html', count: supporters.size) 
  end


  def reached
    t('goal.reached_of_html', 
           current: number_to_currency(revenue, precision: 0), 
           goal: number_to_currency(goal, :precision => 0)
      )
  end

  def days_remaining
    days = expiration_date ? end_date : raw("&infin;")
    t('goal.days_remaining_html', days: days)
  end


  def progress
    if revenue < goal
      content_tag(
        :div, content_tag(:div, nil, id: :progress, style: "width: #{percent}"), 
        id: :progress_bg, class: :small
      )
    end
  end


  def video_embed
    content_tag(:iframe, nil, width: 512, height: 385, src: video)
  end


  def short_description
    truncate description, length: 160
  end


  def call_to_action
    link_to t('home.call_to_action'), new_project_supporter_path(self), class: 'blue_button reserve'
  end
end