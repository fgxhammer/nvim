local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		buffer_close_icon = "",
		close_icon = "",
		indicator = {
			icon = " ",
		},
		left_trunc_marker = "",
		modified_icon = "●",
		offsets = { { filetype = "NvimTree", text = "", text_align = "center" } },
		right_trunc_marker = "",
		show_close_icon = false,
		show_tab_indicators = true,
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
