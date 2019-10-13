module CreditCardsHelper

  # 使用期限の選択肢(month)
  def limit_y
    years = []
    (Time.current.year..Time.current.year+10).each do |year|
      years << (year % 100).to_s
    end
    years
  end

  # 使用期限の選択肢(year)
  def limit_m
    (1..12).map do |month|
      if month < 10
        "0#{month}"
      else
        "#{month}"
      end
    end
  end

end
