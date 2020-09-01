class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #ユーザー情報
  #ニックネームが必須であること
  validates :nickname, presence: true
  #メールアドレスが必須であること
  validates :email, presence: true
  #メールアドレスが一意性であること
  validates :email, uniqueness: true
  #メールアドレスは@を含む必要があること
  validates :email, inclusion: { in: ["@"] }
  #パスワードが必須であること
  validates :password, presence: true
  #パスワードは6文字以上であること
  validates :password, length: { minimum: 6 }
  #パスワードは半角英数字混合であること
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  #パスワードは確認用を含めて2回入力すること(必須、６文字以上)
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  #本人情報確認
  #ユーザー本名が、名字と名前がそれぞれ必須であること
  validates :family_name, presence: true
  validates :first_name, presence: true
  #ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, format: { with: VALID_NAME_REGEX }
  validates :first_name, format: { with: VALID_NAME_REGEX }
  #ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  #ユーザー本名のフリガナは全角（カタカナ）で入力させること
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX }
  #生年月日が必須であること
  validates :birth_day, presence: true
end
