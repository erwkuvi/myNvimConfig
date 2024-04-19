local utils = require("new-file-template.utils")

local function base_template(path, filename)
    local class_name = vim.split(filename, "%.")[1]

    return [[
#ifndef ]] .. string.upper(class_name) .. [[_H
#define ]] .. string.upper(class_name) .. [[_H
#include <string>

class ]] .. class_name .. [[ {
private:
    // Add your private members here

public:
    ]] .. class_name .. [[(void);
    //]] .. class_name .. [[(const std::string& arg); // In case you need to pass an  argument
    ]] .. class_name .. [[(const ]] .. class_name .. [[& instance);
    ]] .. class_name .. [[&operator=(const ]] .. class_name .. [[& rhs);
    ~]] .. class_name .. [[(void);

    // Add your class members and methods here
};

std::ostream& operator<<(std::ostream& output, const ]] .. class_name .. [[& instance);

#endif // ]] .. string.upper(class_name) .. [[_H
]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = ".*", content = base_template },
  }

	return utils.find_entry(template, opts)
end
