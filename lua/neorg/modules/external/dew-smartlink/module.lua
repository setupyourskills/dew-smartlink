local neorg = require "neorg.core"
local modules = neorg.modules

local module = modules.create "external.dew-smartlink"

module.setup = function()
  return {
    requires = {
      "core.neorgcmd",
    },
  }
end

module.load = function()
  module.required["core.neorgcmd"].add_commands_from_table {
    dew_smartlink = {
      args = 0,
      name = "dew-smartlink.run",
    },
  }
end

module.private = {
  insert_link_with_title = function()
    local url = vim.fn.getreg "+"

    if url == "" then
      vim.notify("Clipboard is empty or doesn't contain any URL", vim.log.levels.WARN)
      return
    end

    local html_content = vim.fn.system { "curl", "-sL", url }
    if vim.v.shell_error ~= 0 then
      vim.notify("Failed to fetch URL content", vim.log.levels.ERROR)
      return
    end

    local title = html_content:match "<title[^>]*>(.-)</title>" or "Untitled page"
    local formated_link = string.format("{%s}[%s]", url, vim.fn.trim(title))
    vim.api.nvim_put({ formated_link }, "c", true, true)
  end,
}

module.on_event = function(event)
  if event.split_type[2] == "dew-smartlink.run" then
    module.private.insert_link_with_title()
  end
end

module.events.subscribed = {
  ["core.neorgcmd"] = {
    ["dew-smartlink.run"] = true,
  },
}

return module
