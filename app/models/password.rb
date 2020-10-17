class Password < ApplicationRecord
    validates :name, presence: true
    validates :user_name, presence: true
		#belongs_to :user
		
		def self.matches(field_name, param) 
			where("#{field_name} like ?", "%#{param}%")
		end

		def self.search(param)
			param.strip!
			to_send_back = (user_name_matches(param) + notes_matches(param)).uniq
			return nil unless to_send_back
			to_send_back
		end
		
		def self.user_name_matches(param)
			matches('user_name', param)
		end

		def self.notes_matches(param)
			matches('notes', param)
		end
    
end