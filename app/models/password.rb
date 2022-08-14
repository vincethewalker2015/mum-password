class Password < ApplicationRecord
    validates :name, presence: true
    validates :user_name, presence: true
    #belongs_to :user

    def self.matches(field_name, param) 
		Password.where("#{field_name} like ?", "%#{param}%")
	end

	def self.search(param)
		param.strip!
		to_send_back = name_matches(param).uniq
		return nil unless to_send_back
		to_send_back
	end

	def self.name_matches(param) 
		matches('cast(name as text)', param)
	end
    
end