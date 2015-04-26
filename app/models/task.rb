class Task < ActiveRecord::Base
  include PublicActivity::Model

  before_save :markdown_to_html

  tracked owner: ->(controller, model) { controller && controller.current_user }

  scope :authored_by, ->(user) { where(author: user) }
  scope :owned_by, ->(user) { where(owner: user) }
  scope :with_status, ->(status) { where(status: status) }

  validates_presence_of :name
  validates_presence_of :author
  validates_presence_of :project
  validates_presence_of :status

  belongs_to :author, class_name: 'User'
  belongs_to :owner, class_name: 'User'

  belongs_to :project

  belongs_to :status

  has_many :comments, dependent: :destroy

  private
  def markdown_to_html
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    self.html_desc = markdown.render(markdown_desc)
  end
end
