local validate = require("hand-side-fix.validate-config")
local default_config = require("hand-side-fix").config

local validator = function(config, valid_expectation, error_msg_expectation)
  local is_valid, error_msg = validate.validate(vim.tbl_deep_extend("force", default_config, config))
  if valid_expectation then
    assert(is_valid)
  else
    assert.is_false(is_valid)
  end

  assert.are.same(error_msg, error_msg_expectation)
  if error_msg ~= error_msg_expectation then
    print("error_msg:" .. error_msg)
    print("error_msg_expectation: " .. error_msg_expectation)
  end
end

describe("ValidateConfigModule", function()
  it("should pass on readme config and on no options at all", function()
    local valid_config = {
      layout = "us",
      excludes = { "fi" },
      custom_keywords = {
        {
          pattern = "*.md",
          keywords = { "the", "of" },
        },
      },
    }
    validator(valid_config, true, "")
    valid_config.excludes = nil
    validator(valid_config, true, "")
    valid_config.custom_keywords = nil
    validator(valid_config, true, "")
    valid_config.layout = nil
    validator(valid_config, true, "")
  end)

  it("should pass on valid layout", function()
    validator({ layout = "us" }, true, "")
    validator({ layout = "de" }, true, "")
  end)

  it("should fail with invalid layout", function()
    validator({ layout = "uus" }, false, validate.layout_value_error_msg("uus"))
    validator({ layout = 1 }, false, validate.layout_type_error_msg)
    validator({ layout = function() end }, false, validate.layout_type_error_msg)
  end)

  it("should pass on valid excludes", function()
    validator({ excludes = {} }, true, "")
    validator({ excludes = { "fi", "if" } }, true, "")
  end)

  it("should fail with invalid excludes", function()
    validator({ excludes = { {} } }, false, validate.excludes_error_msg)
    validator({ excludes = { 1, 2 } }, false, validate.excludes_error_msg)
    validator({ excludes = { function() end } }, false, validate.excludes_error_msg)
  end)

  it("should pass on valid custom_keywords", function()
    validator({ custom_keywords = {} }, true, "")
    validator({ custom_keywords = { {
      pattern = "*",
      keywords = { "if" },
    } } }, true, "")
  end)

  it("should pass with valid custom_keywords", function()
    it("and pattern", function()
      validator({ custom_keywords = { { pattern = "*", keywords = {} } } }, true, "")
      validator({ custom_keywords = { { pattern = { "*", "*.lua" }, keywords = { "if" } } } }, true, "")
    end)
    it("and keywords", function()
      validator({ { custom_keywords = { { pattern = "*", keywords = {} } } } }, true, "")
      validator({ custom_keywords = { { pattern = "*", keywords = {} } } }, true, "")
    end)
  end)

  it("should fail with invalid custom_keywords", function()
    validator(
      { custom_keywords = { pattern = "", keywords = {} } },
      false,
      validate.custom_keywords_array_error_msg
    )
    it("and pattern", function()
      local error_msg = table.concat({ validate.custom_keywords_error_msg(1), validate.pattern_error_msg }, ". ")
      validator({ custom_keywords = { { pattern = { 1, 2 }, keywords = {} } } }, false, error_msg)
      validator({ custom_keywords = { { pattern = function() end, keywords = {} } } }, false, error_msg)
    end)

    it("and keywords", function()
      local error_msg = table.concat({ validate.custom_keywords_error_msg(1), validate.keywords_error_msg }, ". ")
      validator({ custom_keywords = { { keywords = { 1, 2 }, pattern = "*" } } }, false, error_msg)
      validator({ custom_keywords = { { keywords = function() end, pattern = "*" } } }, false, error_msg)
    end)
  end)
end)
