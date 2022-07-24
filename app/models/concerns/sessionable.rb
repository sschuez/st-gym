module Sessionable
  extend ActiveSupport::Concern

  included do
    has_many :session_instances, :as => :sessionable
  end
end