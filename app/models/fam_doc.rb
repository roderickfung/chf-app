class FamDoc < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: {scope: :first_name}
  validates :address, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
end
