local M = {}

-- Sample header template
local headerTemplate = [[
%START%
%MIDDLE% EPITECH PROJECT, %YEAR%
%MIDDLE% %FOLDER%
%MIDDLE% File description:
%MIDDLE% %FILENAME%
%END%
]]

local startComments = {
	hs = "{-",
	c = "/*",
	h = "/*",
}

local middleComments = {
	hs = "--",
	c = "**",
	h = "**",
}

local endComments = {
	hs = "-}",
	c = "*/",
	h = "*/",
}

local function getYear()
	return os.date("%Y")
end

local function getFileName()
	return vim.fn.expand("%:t:r")
end

local function getFolderName()
	return vim.fn.expand("%:p:h:t")
end

local function getFileExtension()
	return vim.fn.expand("%:e")
end

local function getStartComment()
	return startComments[getFileExtension()] or "/*"
end

local function getMiddleComment()
	return middleComments[getFileExtension()] or "**"
end

local function getEndComment()
	return endComments[getFileExtension()] or "*/"
end

function M.insertHeader()
	local year = getYear()
	local fileName = getFileName()
	local folderName = getFolderName()
	local startComment = getStartComment()
	local middleComment = getMiddleComment()
	local endComment = getEndComment()

	local header = headerTemplate
	    :gsub("%%START%%", startComment)
	    :gsub("%%MIDDLE%%", middleComment)
	    :gsub("%%END%%", endComment)
	    :gsub("%%YEAR%%", year)
	    :gsub("%%FOLDER%%", folderName)
	    :gsub("%%FILENAME%%", fileName)

	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, vim.split(header, "\n"))
end

return M
