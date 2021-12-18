class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6}
  validates :movie_id, uniqueness: {scope: :list_id, messages: "can't be twice in the same list"}
end
