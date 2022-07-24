class SessionInstance < ApplicationRecord
  belongs_to :session
  belongs_to :sessionable, polymorphic: true
end
