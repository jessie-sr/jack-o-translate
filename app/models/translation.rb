class Translation < ApplicationRecord

    validates :input_text, presence: true
    validates :tone, presence: true
    validates :context, presence: true

    validates :output_text, length: { maximum: 2000 }

end
