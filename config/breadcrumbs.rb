crumb :root do
  link "メルカリ", root_path
end

# トップページ以下
crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :listing do
  link "出品した商品 - 出品中", listing_user_path(current_user)
  parent :mypage
end

crumb :in_progress do
  link "出品した商品 - 取引中", in_progress_user_path(current_user)
  parent :mypage
end

crumb :completed do
  link "出品した商品 - 売却済み", completed_user_path(current_user)
  parent :mypage
end

# マイページ以下
crumb :profile do
  link "プロフィール", profile_user_path(current_user)
  parent :mypage
end

crumb :deliver_address do
  link " 発送元・お届け先住所変更", user_deliver_address_path(current_user)
  parent :mypage
end

crumb :credit_card do
  link "支払い方法", user_credit_card_path(current_user)
  parent :mypage
end

crumb :identification do
  link "本人情報", identification_user_path(current_user)
  parent :mypage
end

crumb :sign_out do
  link "ログアウト", sign_out_path
  parent :mypage
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category do |categories|
  categories.each do |category|
    link category.name, category
  end
  if params[:page].presence
    link "#{params[:page]} ページ目"
  end
  parent :categories
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).