class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, :through => :user_events
  has_many :event_admins
  has_many :users, :through => :event_admins

  has_many :sponsors_events
  has_many :users, :through => :sponsors_events

  has_many :posts

  has_one :publishers
  has_many :activities
  has_many :notifications

  attr_accessible :date, :description, :name, :imageurl, :user_id, :place, :lat, :lon, :date_end

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :place, :presence => true
  validates :date, :presence => true

  def assistants
    @userevents = UserEvent.all(:conditions => ['event_id = ?', self.id])
    @userids = Array.new
    @userevents.each do |userevent|
      @userids.push(userevent.user_id)
    end
    User.find_all_by_id(@userids)
  end

  def admin?(user)
    EventAdmin.exists?(:event_id => self.id, :user_id => user.id)
  end

  def sponsors
    ids = SponsorsEvent.where(:event_id => self.id).collect(&:user_id)
    return User.all(:conditions => ["id IN (?)", ids])
  end

end
