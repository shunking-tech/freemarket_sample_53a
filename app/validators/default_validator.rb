class DefaultValidator < ActiveModel::Validator
# --------------------------------------------------------------------
  # 新しいカスタムバリデータはDefaultValidatorを継承
  # ファイル名はuser_validator.rbなどモデル名+_validator.rbに
  # 各バリデーション用メソッド名は〇〇_validate(record, カラム名)にしてください
  # 例(nickname_validate(record, nickname)など)
# --------------------------------------------------------------------

  def validate(record)
    validate_methods.each do |method|
      method_name = method.match(/def\s*(.+)/)[1]
      validate_method = method_name.gsub(/, /, ", record.")
      eval(validate_method)
    end
  end

  private

  def validate_methods
    file_name = self.class.to_s.underscore + ".rb"
    path = Rails.root.join('app', 'validators', file_name).to_s
    methods = []
    File.open(path) do |file|
      file.each_line do |line|
        methods << line if line =~ /def.*_validate/
      end
    end
    return methods
  end
end