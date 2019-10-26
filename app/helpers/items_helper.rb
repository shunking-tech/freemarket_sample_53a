module ItemsHelper
  # TODO: 別ウィンドウで開くようにする
  def facebook_link(instance)
    if instance.is_a?(Item)
      link_to "http://www.facebook.com/share.php?u=#{CGI.escape(url_for(only_path: false))}", target: :_blank, class: 'detail-item__sns--button' do
        content_tag :i, nil, class: 'icon-facebook'
      end
    elsif instance.is_a?(User)
      link_to "http://www.facebook.com/share.php?u=#{CGI.escape(url_for(only_path: false))}", target: :_blank, class: 'detail-user__sns--button' do
        content_tag :i, nil, class: 'icon-facebook'
      end
    end
  end
  
  # TODO: 別ウィンドウで開くようにする
  def twitter_link(instance)
    if instance.is_a?(Item)
      text = "#{instance.name}… (¥#{instance.price.to_s(:delimited)}) #{url_for(only_path: false)} フリマアプリ「freemarket_sample_53a」で販売中♪ #freemarket_sample_53a @freemarket_sample_53aさんから"
    elsif instance.is_a?(User)
      text = "フリマアプリ「メルカリ」で販売しています #{url_for(only_path: false)} #freemarket_sample_53a @freemarket_sample_53aさんから"
    end
    link_to "http://twitter.com/share?count=horizontal&original_referer=#{CGI.escape(url_for(only_path: false))}&text=#{CGI.escape(text)}", class: 'detail-item__sns--button', target: :_blank do
      content_tag :i, nil, class: 'icon-twitter'
    end
  end

  # TODO: 別ウィンドウで開くようにする
  def pinterest_link(instance)
    if instance.is_a?(Item)
      url = CGI.escape(url_for(only_path: false))
      media = CGI.escape(instance.item_images.first.image.url)
      description = CGI.escape("freemarket_sample_53a: #{instance.name} #freemarket_sample_53a")
    elsif instance.is_a?(User)
      return
    end
    link_to "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}", class: 'detail-item__sns--button', target: :_blank do
      content_tag :i, nil, class: 'icon-pinterest'
    end
  end

  def direction_item(direction, item)
    direction_item = eval("Item.#{direction}_item(item)")
    icon_class_name = direction.include?('prev') ? "icon-arrow-left" : "icon-arrow-right"

    if direction_item.present?
      link_to item_path(direction_item) do
        concat direction_item.name
        concat content_tag(:i, nil, class: icon_class_name)
      end
    end
  end
end