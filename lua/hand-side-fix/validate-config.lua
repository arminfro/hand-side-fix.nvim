---@class ValidateConfig
local M = {}

local utils = require("hand-side-fix.utils")

M.custom_keywords_error_msg = function(index)
  return "custom_keywords[" .. index .. "]"
end

M.layout_error_msg = function(layout)
  return "Layout config option "
    .. layout
    .. " not supported. How to: https://github.com/arminfro/hand-side-fix.nvim?tab=readme-ov-file#contributing"
end

M.pattern_error_msg = "`pattern` is not found or invalid, string or array of strings expected"
M.keywords_error_msg = "`keywords` is not found or invalid, array of strings expected"
M.excludes_error_msg = "`excludes` is invalid, array of strings expected"
M.custom_keywords_table_error_msg = " is invalid, table expected"

local compose_error_msgs = function(is_valid, error_msg)
  if is_valid then
    return nil
  else
    return error_msg
  end
end

--- @param custom_keywords_config CustomKeywords
--- @param index number
--- @return boolean, string
local validate_custom_keywords_config = function(custom_keywords_config, index)
  local is_table = utils.is_type(custom_keywords_config, "table")

  if is_table then
    local is_pattern_valid = custom_keywords_config.pattern ~= nil
      and (
        utils.is_type(custom_keywords_config.pattern, "string")
        or (
          utils.is_type(custom_keywords_config.pattern, "table")
          and utils.every(custom_keywords_config.keywords, function(value)
            return utils.is_type(value, "string")
          end)
        )
      )

    local is_keywords_valid = custom_keywords_config.keywords ~= nil
      and utils.is_type(custom_keywords_config.keywords, "table")
      and utils.every(custom_keywords_config.keywords, function(value)
        return utils.is_type(value, "string")
      end)

    local is_valid = is_pattern_valid and is_keywords_valid
    local error_msgs = utils.filter({
      compose_error_msgs(is_valid, M.custom_keywords_error_msg(index)),
      compose_error_msgs(is_pattern_valid, M.pattern_error_msg),
      compose_error_msgs(is_keywords_valid, M.keywords_error_msg),
    })

    return is_valid, table.concat(error_msgs, ". ")
  else
    return false, M.custom_keywords_error_msg(index) .. M.custom_keywords_table_error_msg
  end
end

--- @param layout string
--- @return boolean, string
local validate_layout = function(layout)
  return pcall(require, "hand-side-fix.layouts." .. layout), M.layout_error_msg(layout)
end

--- @param excludes string[]
--- @return boolean, string
local validate_excludes = function(excludes)
  return utils.is_type(excludes, "table") and utils.every(excludes, function(value)
    return utils.is_type(value, "string")
  end),
    M.excludes_error_msg
end

local validate_custom_keywords_configs = function(custom_keywords_configs)
  if custom_keywords_configs == nil then
    return true, ""
  end

  local all_valid, error_msgs = true, {}
  for index, custom_keywords_config in pairs(custom_keywords_configs) do
    local is_valid, error_msg = validate_custom_keywords_config(custom_keywords_config, index)
    if not is_valid then
      table.insert(error_msgs, error_msg)
    end
    all_valid = all_valid and is_valid
  end
  return all_valid, table.concat(error_msgs, ". ")
end

--- @param config Config
--- @return boolean, string
M.validate = function(config)
  local is_custom_keywords_valid, custom_keywords_error_msg = validate_custom_keywords_configs(config.custom_keywords)
  local is_layout_valid, layout_valid_error_msg = validate_layout(config.layout)
  local is_excludes_valid, excludes_valid_error_msg = validate_excludes(config.excludes)

  local is_valid = is_custom_keywords_valid and is_layout_valid and is_excludes_valid
  local error_msgs = is_valid and {}
    or utils.filter({
      compose_error_msgs(is_custom_keywords_valid, custom_keywords_error_msg),
      compose_error_msgs(is_layout_valid, layout_valid_error_msg),
      compose_error_msgs(is_excludes_valid, excludes_valid_error_msg),
    })

  return is_valid, table.concat(error_msgs, ". ")
end

return M
