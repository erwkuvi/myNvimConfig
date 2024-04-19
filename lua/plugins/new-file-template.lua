return{
	"otavioschwanck/new-file-template.nvim",
	opts = {
		disable_insert = false, -- Enter in insert mode after inserting the template?,
		disable_autocmd = false, -- Disable the autocmd that creates the template.  You can use manually by calling :InsertTemplateFile,
		disable_filetype = {}, -- Disable templates for a filetype (disable only default templates.  User templates will work).
		disable_specific = {}, -- Disable specific regexp for the default templates.  Example: { ruby = { ".*" } }.  To see the regexps, just look into lua/templates/{filetype}.lua for the regexp being used.
	}
}

