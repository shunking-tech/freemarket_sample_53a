class DefaultValidator < ActiveModel::Validator
# --------------------------------------------------------------------
  # 新しいカスタムバリデータはDefaultValidatorを継承
  # 各バリデーション用メソッドは〇〇_validate(record)にしてpublicに
  # 例: nickname_validate(record)
# --------------------------------------------------------------------

  def validate(record)
    instance_variable_set_record_attributes(record)
    public_methods(false).each do |method|
      send(method, record) if method.match(/_validate/)
    end
  end

  private

  def instance_variable_set_record_attributes(record)
    record.class.column_names.each do |column|
      instance_variable_set("@#{column}", eval("record.#{column}"))
    end
  end
end