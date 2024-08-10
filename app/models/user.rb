class User < ApplicationRecord
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional user fields validations
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end
