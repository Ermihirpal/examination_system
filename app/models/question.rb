class Question < ApplicationRecord
  belongs_to :exam
  has_many :options
  has_many :responses
  has_many :students, through: :responses


  accepts_nested_attributes_for :options, :allow_destroy => true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "exams_id", "id", "que", "updated_at"]
  end
  
end
