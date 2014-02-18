class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.login_field = "login"
  end
  attr_accessible :firstname, :lastname, :password, :email, :login
  validates :login, presence: true, uniqueness: true

  after_destroy :ensure_an_admin_remains
  
  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end
  
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end


  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Impossible de supprimer le dernier utilisateur"
      end
    end     
end