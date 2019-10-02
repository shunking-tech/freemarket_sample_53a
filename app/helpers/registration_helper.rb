module RegistrationHelper

  def has_error(errors)
    errors.present? ? "has-error" : ""
  end

  def bar_lists
    ["会員情報", "電話番号認証", "お届け先住所入力", "支払い方法", "完了"]
  end

  def bar_status(index, status_number)
    if index == status_number
      "active"
    elsif index < status_number
      "through"
    end
  end

  def years
    years = []
    (Time.current.year-119..Time.current.year).reverse_each do |year|
      years << year
    end
    years
  end

  def months
    (1..12).map do |month|
      month
    end
  end
end
