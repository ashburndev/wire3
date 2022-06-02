class Attachment < ApplicationRecord
  belongs_to :document
  belongs_to :binary
end
