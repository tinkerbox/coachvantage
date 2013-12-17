module ContentHelper

	def leftbar_class(menu)
		if controller.controller_name == menu
			"active"
		end
	end
end
