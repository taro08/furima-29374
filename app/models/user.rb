class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX, message: "＠を使ってください。" }
  validates :nickname, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :encrypted_password, presence: true
  validates :birth_day, presence: true

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :last_name, format:  { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

end
