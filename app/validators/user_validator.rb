class UserValidator < ActiveModel::Validator
  def validate(record)
    nickname_validate(record, record.nickname)
  end

  private

  def nickname_validate(record, nickname)
    if nickname.length == 0
      record.errors[:nickname] << "ニックネームを入力してください"
    elsif nickname.length > 20
      record.errors[:nickname] << "20文字以下で入力してください"
    end
  end
end