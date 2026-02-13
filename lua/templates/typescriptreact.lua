local utils = require("new-file-template.utils")

-- 1. Define the TSX template function
local function tsx_template(_, filename)
  -- Extracts filename without extension (e.g., "MyComponent.tsx" -> "MyComponent")
  local component_name = vim.split(filename, "%.")[1]
  
  return string.format([[
import React from 'react';

interface Props {
  |cursor|
}

const %s = ({}: Props) => {
  return (
    <div>
      
    </div>
  );
};

export default %s;
]], component_name, component_name, component_name, component_name)
end

-- 2. Define a fallback/base template if no specific pattern matches
local function base_template(_, filename)
  return "// New file: " .. filename .. "\n"
end

--- @param opts table
return function(opts)
  -- The 'pattern' is a Lua regex matched against the relative path
  local template = {
    { pattern = "%.tsx$", content = tsx_template }, -- Use $ to match end of string
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry(template, opts)
end
