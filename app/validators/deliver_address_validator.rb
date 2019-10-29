class DeliverAddressValidator < DefaultValidator

  def first_name_validate(record, first_name)
    if first_name.blank?
      record.errors[:first_name] << "入力してください"
    elsif 35 < first_name.length
      record.errors[:first_name] << "名は35文字までです"
    end
  end

  def first_name_kana_validate(record, first_name_kana)
    katakana_regex = /\A[\p{katakana}]+\z/
    if first_name_kana.blank?
      record.errors[:first_name_kana] << "入力してください"
    elsif 35 < first_name_kana.length
      record.errors[:first_name_kana] << "名カナは35文字までです"
    elsif first_name_kana.match(katakana_regex) == nil
      record.errors[:first_name_kana] << "名カナはカナ文字を入力してください"
    end
  end

  def last_name_validate(record, last_name)
    if last_name.blank?
      record.errors[:last_name] << "入力してください"
    elsif 35 < last_name.length
      record.errors[:last_name] << "姓は35文字までです"
    end
  end

  def last_name_kana_validate(record, last_name_kana)
    katakana_regex = /\A[\p{katakana}]+\z/
    if last_name_kana.blank?
      record.errors[:last_name_kana] << "入力してください"
    elsif 35 < last_name_kana.length
      record.errors[:last_name_kana] << "姓カナは35文字までです"
    elsif last_name_kana.match(katakana_regex) == nil
      record.errors[:last_name_kana] << "姓カナはカナ文字を入力してください"
    end
  end

  def phone_number_validate(record, phone_number)
    phone_regex = /\A\d{10,11}\z/
    if phone_number.present? && phone_number.match(phone_regex) == nil
      record.errors[:phone_number] << "フォーマットが不適切です"
    end
  end

  def city_validate(record, city)
    if city.blank?
      record.errors[:city] << "入力してください"
    elsif 50 < city.length
      record.errors[:city] << "50文字以下で入力してください"
    end
  end

  def house_address_validate(record, house_address)
    if house_address.blank?
      record.errors[:house_address] << "入力してください"
    elsif 100 < house_address.length
      record.errors[:house_address] << "100文字以下で入力してください"
    end
  end

  def building_name_validate(record, building_name)
    if building_name && 100 < building_name.length
      record.errors[:building_name] << "100文字以下で入力してください"
    end
  end

  def zipcode_validate(record, zipcode)
    zipcode_regex = /\A\d{3}-\d{4}\z/
    if zipcode.blank?
      record.errors[:zipcode] << "入力してください"
      record.errors[:zipcode] << "フォーマットが不適切です" if zipcode.match(zipcode_regex) == nil
    elsif zipcode.match(zipcode_regex) == nil
      record.errors[:zipcode] << "フォーマットが不適切です"
    end
  end
end