module ContentHelper

	def sidebar_class(menu)
		if controller.controller_name == menu
			"active"
		end
	end
end
