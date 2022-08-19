class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  validate :password_complexity
  validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kata, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kata, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :dob, presence: true

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Za-z])(?=.*?[0-9])/

    errors.add :password, 'Complexity requirement not met'
  end

end
