require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#ユーザー登録' do

    # # 全てのデータがある時、正常に登録できる
    # it "is valid with a nickname, email, first_name, first_name_kana, last_name, last_name_kana, birth_date, password, password_confirmation" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    # nicknameが空の場合、登録できないことを確かめる
    it "nicknameが空の場合、登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームを入力してください")
    end

    # nicknameは21字以上の時、登録できない
    it "nicknameは21字以上の時、登録できない " do
      user = build(:user, nickname: "012345678901234567890")
      user.valid?
      expect(user.errors[:nickname][0]).to include("20文字以下で入力してください")
    end

    # nicknameは20字以下の時、登録できる
    it "nicknameは20字以下の時、登録できる" do
      user = build(:user, nickname: "01234567890123456789")
      expect(user).to be_valid
    end

    # emailが空の場合、登録できないことを確かめる
    it "emailが空の場合、登録できないことを確かめる" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスを入力してください")
    end

    # メールアドレスのフォーマットをチェック
    it "メールアドレスのフォーマットをチェック" do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email]).to include("フォーマットが不適切です")
    end

    # emailの重複チェック
    it "emailの重複チェック" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # passwordが空の場合、登録できないことを確かめる
    it "passwordが空の場合、登録できないことを確かめる" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードを入力してください")
    end

    # passwordはあるが、password_confirmationが空の場合、登録できないことを確かめる
    it "passwordはあるが、password_confirmationが空の場合、登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません", "パスワード (確認) を入力してください")
    end

    # passwordが6字以下の時、登録できない
    it "passwordが6字以下の時、登録できない" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password][0]).to include("パスワードは7文字以上128文字以下で入力してください")
    end

    # passwordが129以上の時、登録できない
    it "passwordが129字以上の時、登録できない" do
      user = build(:user, password: "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111a", password_confirmation: "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111a")
      user.valid?
      expect(user.errors[:password][0]).to include("パスワードは7文字以上128文字以下で入力してください")
    end

    # passwordのフォーマットをチェック
    it "passwordのフォーマットをチェック" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password][0]).to include("英字と数字両方を含むパスワードを設定してください")
    end

    # passwordは7文字以上128文字以下で、英字と数字両方を含むの時、登録できる
    it "passwordは7文字以上128文字以下で、英字と数字両方を含むの時、登録できる" do
      user = build(:user, password: "1234abc", password_confirmation: "1234abc")
      expect(user).to be_valid
    end

    # first_nameが空の場合、登録できないことを確かめる
    it "first_nameが空の場合、登録できない" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("名を入力してください")
    end

    # first_nameは36字以上の時、登録できない
    it "first_nameは36字以上の時、登録できない" do
      user = build(:user, first_name: "123456789012345678901234567890123456")
      user.valid?
      expect(user.errors[:first_name][0]).to include("名は35文字までです")
    end
    
    # first_nameは35字以下の時、登録できる
    it "first_nameは35字以下の時、登録できる" do
      user = build(:user, first_name: "12345678901234567890123456789012345")
      expect(user).to be_valid
    end

    # first_name_kanaが空の場合、登録できないことを確かめる
    it "first_name_kanaが空の場合、登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("名カナを入力してください")
    end
    
    # first_name_kanaは36字以上の時、登録できない
    it "first_name_kanaは36字以上の時、登録できない" do
      user = build(:user, first_name_kana: "123456789012345678901234567890123456")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("名カナは35文字までです")
    end

    # first_name_kanaはカナ文字ではない時、登録できない
    it "first_name_kanaはカナ文字ではない時、登録できない" do
      user = build(:user, first_name_kana: "あああああああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("名カナはカナ文字を入力してください")
    end

    # first_name_kanaは35字以下の時、登録できる
    it "first_name_kanaは35字以下の時、登録できる" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      expect(user).to be_valid
    end

    # last_nameが空の場合、登録できないことを確かめる
    it "last_nameが空の場合、登録できない" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("姓を入力してください")
    end
    
    # last_nameは36字以上の時、登録できない
    it "last_nameは36字以上の時、登録できない" do
      user = build(:user, last_name: "123456789012345678901234567890123456")
      user.valid?
      expect(user.errors[:last_name][0]).to include("姓は35文字までです")
    end

    # last_nameは35字以下の時、登録できる
    it "last_nameは35字以下の時、登録できる" do
      user = build(:user, last_name: "12345678901234567890123456789012345")
      expect(user).to be_valid
    end

    # last_name_kanaが空の場合、登録できないことを確かめる
    it "last_name_kanaが空の場合、登録できない" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("姓カナを入力してください")
    end
    
    # last_name_kanaは36字以上の時、登録できない
    it "last_name_kanaは36字以上の時、登録できない" do
      user = build(:user, last_name_kana: "123456789012345678901234567890123456")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("姓カナは35文字までです")
    end

    # last_name_kanaはカナ文字ではない時、登録できない
    it "last_name_kanaはカナ文字ではない時、登録できない" do
      user = build(:user, last_name_kana: "あああああああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("姓カナはカナ文字を入力してください")
    end

    # last_name_kanaは35字以下の時、登録できる
    it "last_name_kanaは35字以下の時、登録できる" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      expect(user).to be_valid
    end

  end
end
