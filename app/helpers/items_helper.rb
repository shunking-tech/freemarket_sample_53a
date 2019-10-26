module ItemsHelper
  # TODO: 別ウィンドウで開くようにする
  def facebook_link
    link_to "http://www.facebook.com/share.php?u=#{CGI.escape(url_for(only_path: false))}", target: :_blank, class: 'detail-item__sns--button' do
      content_tag :i, nil, class: 'icon-facebook'
    end
  end
  
  # TODO: 別ウィンドウで開くようにする
  def twitter_link(item)
    text = "#{item.name}… (¥#{item.price.to_s(:delimited)}) #{url_for(only_path: false)} フリマアプリ「freemarket_sample_53a」で販売中♪ #freemarket_sample_53a @freemarket_sample_53aさんから"
    link_to "http://twitter.com/share?count=horizontal&original_referer=#{CGI.escape(url_for(only_path: false))}&text=#{CGI.escape(text)}", class: 'detail-item__sns--button', target: :_blank do
      content_tag :i, nil, class: 'icon-twitter'
    end
  end

  # TODO: 別ウィンドウで開くようにする
  def pinterest_link(item)
    url = CGI.escape(url_for(only_path: false))
    media = CGI.escape(item.item_images.first.image.url)
    description = CGI.escape("freemarket_sample_53a: #{item.name} #freemarket_sample_53a")
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

  def payer_delivery_expense_explanation(select)
    select = Item.payer_delivery_expenses_i18n.invert
    return_hash = {}
    select.each{|key, value|
      if select.invert[value] == Item.payer_delivery_expenses_i18n[:seller_burden]
        return_hash[select.invert[value] += "(出品者負担)"] = select[key]
      elsif select.invert[value] == Item.payer_delivery_expenses_i18n[:buyer_burden]
        return_hash[select.invert[value] += "(購入者負担)"] = select[key]
      else
      end
    }
    return return_hash
  end

end