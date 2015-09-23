class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  scope :public_viewable, -> { where(private: false)}

 
end