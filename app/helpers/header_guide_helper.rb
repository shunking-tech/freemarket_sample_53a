module HeaderGuideHelper
  # ドロップダウンリストヘルパー（ancestryのみ対応）
  def ddmenu_list(roots, index = nil)
    unless index
      index = 1
    else
      index += 1
    end

    roots.each do |root|
      concat (
        content_tag(:li) do
          concat link_to root.name, url_for(root), class: 'ddmenu--category_link'
          if root.has_children?
            concat (
              content_tag(:ul, class: "ddmenu--#{index}-level") do
                ddmenu_list(root.children.limit(roots.count), index)
              end
            )
          end
        end
      )
    end
  end
end