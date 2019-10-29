class UserValidator < DefaultValidator

  def nickname_validate(record, nickname)
    if nickname.blank?
      record.errors[:nickname] << "ニックネームを入力してください"
    elsif 20 < nickname.length
      record.errors[:nickname] << "20文字以下で入力してください"
    end
  end

  def email_validate(record, email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    if email.blank?
      record.errors[:email].push("メールアドレスを入力してください").shift()
    elsif email.match(email_regex) == nil
      record.errors[:email].push("フォーマットが不適切です").shift()
    end
  end

  def password_validate(record, password)
    password_regex = /\A(?=.*?[a-z])(?=.*?\d).+\z/i
    # (?=.*?[^@\s[[:blank:]]:\p{Hiragana}\p{Katakana}[ー－][一-龠々]、。\n])
    if password.blank?
      record.errors[:password].push("パスワードを入力してください", "パスワードは7文字以上128文字以下で入力してください", "英字と数字両方を含むパスワードを設定してください").shift()
    else
      if password.length < 7 || 128 < password.length
        record.errors[:password].push("パスワードは7文字以上128文字以下で入力してください").shift()
      end
      unless password.match(password_regex)
        record.errors[:password] << "英字と数字両方を含むパスワードを設定してください"
      end
    end
  end

  def password_confirmation_validate(record, password, password_confirmation)
    password_regex = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    if password_confirmation.blank?
      record.errors[:password_confirmation] << "パスワード (確認) を入力してください"
    elsif password_confirmation != password
      if password.present?
        record.errors[:password_confirmation].push("パスワードとパスワード (確認) が一致しません").shift()
      else
        record.errors[:password_confirmation].shift()
      end
    end
  end

  def first_name_validate(record, first_name)
    if first_name.blank?
      record.errors[:first_name] << "名を入力してください"
    elsif 35 < first_name.length
      record.errors[:first_name] << "名は35文字までです"
    end
  end

  def first_name_kana_validate(record, first_name_kana)
    katakana_regex = /\A[\p{katakana}]+\z/
    if first_name_kana.blank?
      record.errors[:first_name_kana] << "名カナを入力してください"
    elsif 35 < first_name_kana.length
      record.errors[:first_name_kana] << "名カナは35文字までです"
    elsif first_name_kana.match(katakana_regex) == nil
      record.errors[:first_name_kana] << "名カナはカナ文字を入力してください"
    end
  end

  def last_name_validate(record, last_name)
    if last_name.blank?
      record.errors[:last_name] << "姓を入力してください"
    elsif 35 < last_name.length
      record.errors[:last_name] << "姓は35文字までです"
    end
  end

  def last_name_kana_validate(record, last_name_kana)
    katakana_regex = /\A[\p{katakana}]+\z/
    if last_name_kana.blank?
      record.errors[:last_name_kana] << "姓カナを入力してください"
    elsif 35 < last_name_kana.length
      record.errors[:last_name_kana] << "姓カナは35文字までです"
    elsif last_name_kana.match(katakana_regex) == nil
      record.errors[:last_name_kana] << "姓カナはカナ文字を入力してください"
    end
  end

  def birth_date_validate(record, birth_date)
    birth_date_regex = /\A\d{4}\/\d+\/\d+\z/
    if birth_date.blank?
      record.errors[:birth_date] << "生年月日を入力してください"
    elsif birth_date.match(birth_date_regex) == nil
      record.errors[:birth_date] << "生年月日を正しく入力してください"
    end
  end

  def phone_number_validate(record, phone_number)
    phone_regex = /\A\d{10,11}\z/
    if phone_number && phone_number.match(phone_regex) == nil
      record.errors[:phone_number] << "フォーマットが不適切です"
    end
  end

  def city_validate(record, city)
    if city && 50 < city.length
      record.errors[:city] << "50文字以下で入力してください"
    end
  end

  def house_address_validate(record, house_address)
    if house_address && 100 < house_address.length
      record.errors[:house_address] << "100文字以下で入力してください"
    end
  end

  def building_name_validate(record, building_name)
    if building_name && 100 < building_name.length
      record.errors[:building_name] << "100文字以下で入力してください"
    end
  end

  def zipcode_validate(record, zipcode)
    zipcode_regex = /\A\d{7}\z/
    if zipcode && zipcode.match(zipcode_regex) == nil
      record.errors[:zipcode] << "フォーマットが不適切です"
    end
  end
end