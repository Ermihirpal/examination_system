class Response < ApplicationRecord
    belongs_to :question
    belongs_to :student
end
