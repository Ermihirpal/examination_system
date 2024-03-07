class Option < ApplicationRecord
    belongs_to :question


  def self.ransackable_associations(auth_object = nil)
    ["question"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "option_val","is_correct", "question_id", "updated_at"]
  end
end
