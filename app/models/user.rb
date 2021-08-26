class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_and_belongs_to_many :roles
  #after_create :add_role

  # def can_do_method?(method)
  #   self.rights.detect { |r| r.name == method }
  # end
  def has_role?(role_name, obj=nil)
    self.roles == role_name
  end
  
  def has_role!(role_name, obj=nil)
    self.roles = role_name
    save!
  end

  def add_role(role_id)
    roles << Role.find_by(id: role_id)
  end

end
