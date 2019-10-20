crumb :root do
  link "メルカリ", root_path
end

# トップページ以下
crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

# マイページ以下
crumb :profile do
  link "プロフィール", profile_user_path(current_user)
  parent :mypage
end

crumb :deliver_address do
  link " 発送元・お届け先住所変更", deliver_address_user_path(current_user)
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