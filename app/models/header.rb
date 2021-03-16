class Header < ApplicationRecord
  belongs_to :payment, optional: true
end
