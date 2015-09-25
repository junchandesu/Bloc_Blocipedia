class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  scope :public_viewable, -> { where(private: false)}
 scope :visible_to, ->  (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? where(private: true, user: user)+ where(private: false) + where(private: nil) : where(private: false) + where(private: nil) }
  # def self.visible_to(user)
  # 	wikis = []
  # 	if user.admin? || user.premium?
  # 		wikis = Wiki.all
  # end 
 


  # def self.visible_to(user)
#    	wikis = []
#    	if !user.any?
#    		wikis = Wiki.where(private: false)
#    		wikis

#    	if user.admin? 
#    		wikis= Wiki.all
#    		wikis
#    	elsif user.premium?
#    		wikis = Wiki.where(private: false) << (user.wikis.where(private: true))
#    		wikis
#    	end
#    end
# end
	
end