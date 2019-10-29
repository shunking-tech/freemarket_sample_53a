module ListingsHelper
  def listings_title
    if active_page.include?('listing')
      content_tag :h3, "出品した商品", class: "listings__title"
    elsif active_page.include?('in_progress')
      content_tag :h3, "取引中の商品", class: "listings__title"
    elsif active_page.include?('completed')
      content_tag :h3, "売却済みの商品", class: "listings__title"
    end
  end

  def listings_list(list)
    list.each do |type|
        concat (
          content_tag :li, class: "listings__content__list__title #{ 'active' if active_page.include?(type) }" do
            concat link_to item_tag(type), eval("#{type}_user_path(current_user)")
          end
        )
    end
  end

  def active_item_tag
    item_tag(active_page)
  end

  def active_page
    if request.url.include?(listing_user_url(current_user))
      'listing'
    elsif request.url.include?(in_progress_user_url(current_user))
      'in_progress'
    elsif request.url.include?(completed_user_url(current_user))
      'completed'
    end
  end

  private

  def item_tag(type)
    case type
    when 'listing'
      "出品中"
    when 'in_progress'
      "取引中"
    when 'completed'
      "売却済み"
    end
  end
end