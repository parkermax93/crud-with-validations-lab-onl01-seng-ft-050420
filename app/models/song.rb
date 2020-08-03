class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}

  validates :artist_name, presence: true

  validates :released, exclusion: { in: [nil]}

  validates :release_year, numericality: {
    only_integer: true,
    presence: true, if: :released?,
    less_than_or_equal_to: ->(_song) { Date.current.year }
  }

end