class Track < ApplicationRecord
  validates :ord, presence: true
  validates :title, presence: true
  belongs_to :album
end
