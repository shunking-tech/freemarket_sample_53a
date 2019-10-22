module HeaderGuideHelper
  # ドロップダウンリストヘルパー（ancestryのみ対応）
  def ddmenu_list(roots)
    roots.each do |root|
      concat (
        content_tag(:li) do
          concat link_to root.name, url_for(root)
          if root.has_children?
            concat (
              content_tag(:ul) do
                ddmenu_list(root.children.limit(roots.count))
              end
            )
          end
        end
      )
    end
  end
end