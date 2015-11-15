class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
 has_many :collaborators
 has_many :wikis, through: :collaborators
 after_initialize :init


  def standard?
  	role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  def admin?
  	role == 'admin'
  end

  private
    
   def init
    self.role ||="standard"
  end

end
