class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :nickname
    validates :password, length: {minimum: 6}
    validates :encrypted_password
    validates :birth_day
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :first_name, format: { with: NAME_REGEX, message: 'は全角で入力してください。'}
    validates :last_name, format:  { with: NAME_REGEX, message: 'は全角で入力してください。'}
    NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :first_name_reading, format: { with: NAME_READING_REGEX, message: 'は全角カタカナで入力して下さい。'}
    validates :last_name_reading, format: { with: NAME_READING_REGEX, message: 'は全角カタカナで入力して下さい。'}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: '＠を使ってください。' }
  end
end
