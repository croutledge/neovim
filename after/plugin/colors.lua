function SetColorScheme(color)
	color = color or 'codedark'
	vim.cmd.colorscheme(color)
end

SetColorScheme()
