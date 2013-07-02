module ApplicationHelper
	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else
			""
		end
	end

	def format(text)
		sanitize(markdown(text))
	end

  # Process text with Markdown.                                                                 
	def markdown(text)
		BlueCloth::new(text).to_html
	end
end
