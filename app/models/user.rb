class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_one_attached :avatar
  has_many :tweets, dependent: :destroy

  scope :recent, -> { order('created_at desc') }

  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"]).or(User.where(['profile LIKE ?', "%#{search}%"]))
    else
      User.all
    end
  end
end