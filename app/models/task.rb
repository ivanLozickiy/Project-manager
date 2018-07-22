class Task < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :users
  status_options = ['new', 'in progress', 'done']
  validates_inclusion_of :status, :in => status_options
end
