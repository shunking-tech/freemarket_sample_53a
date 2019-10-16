class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :trade

  enum score: [:good, :normal, :bad], _suffix: true

end
