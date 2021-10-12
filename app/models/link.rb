class Link < ApplicationRecord
    # has_and_belongs_to_many :tags
    acts_as_taggable_on :tags
end
