class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :validate_admin_limit, on: :create

  def validate_admin_limit
    if Admin.count >= 2
      errors.add(:base, "You can't create more than two admins")
    end
  end

end
