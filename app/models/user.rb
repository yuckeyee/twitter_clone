class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_one_attached :avatar
  has_many :tweets, dependent: :destroy

  scope :recent, -> { order('created_at desc') }
  scope :search, ->(keyword) {
    if keyword.present?
      where('name LIKE :keyword OR profile LIKE :keyword',
            keyword: "%#{sanitize_sql_like(keyword)}%")
    end
  }
end
