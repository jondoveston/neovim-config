local Config = require "adr-tools.config"

local uv = vim.uv or vim.loop

local M = {}

-- The name of the file in the project root
local dir_file = ".adr-dir"
local dir = nil

-- Read file relative to cwd
local function read_dir_file_from_cwd()
  local cwd = vim.loop.cwd()
  local path = cwd .. "/" .. dir_file

  local file = io.open(path, "r")
  if not file then
    vim.notify("[adr-tools] Could not open dir file in project root: " .. path, vim.log.levels.WARN)
    return nil
  end

  local content = file:read "*a"
  file:close()
  return content
end

local function reload_dir_file()
  local content = read_dir_file_from_cwd()
  if content then
    dir = content
    vim.notify("[adr-tools] Reloaded dir file from " .. vim.loop.cwd())
  else
    dir = nil
  end
end

function M.setup(opts)
  Config.setup(opts)
  reload_dir_file()

  vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
      reload_dir_file()
    end,
    desc = "[adr-tools] Reload dir file from project root on cwd change",
  })
end

--- get adr dir
---@return string
function M.dir()
  return dir
end

--- get adr list
---@return string[]
function M.list()
  if uv.fs_stat(dir_file) then
    local ret = vim.system({ "adr", "list" }, { text = true }):wait()
    local lines = vim.split(ret.stdout, "\n", { trimempty = true })
    return ret.code == 0 and lines or nil
  end
end

--- new adr
---@return string
function M.new(name)
  if uv.fs_stat(dir_file) then
    local ret = vim.system({ "adr", "new", name }, { text = true, env = { VISUAL = "", EDITOR = "" } }):wait()
    local lines = vim.split(ret.stdout, "\n", { trimempty = true })
    return ret.code == 0 and lines[1] or nil
  end
end

return M
