class Exam < ApplicationRecord

  has_many :questions 
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "per_que_mark", "subject", "time_duration", "total_marks", "updated_at"]
  end
  
end
