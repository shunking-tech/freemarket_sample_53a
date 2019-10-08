module Scopes
  extend ActiveSupport::Concern

  included do
      scope :recently, -> { order('created_at desc, id desc') }
  end
end