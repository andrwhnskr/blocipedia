class User < ActiveRecord::Base
  has_and_belongs_to_many :wikis
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :init, :if => :new_record?

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end
  
  def init
    self.role ||= 'standard'
  end

end
