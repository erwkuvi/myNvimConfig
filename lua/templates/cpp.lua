local utils = require("new-file-template.utils")

local function base_template(path, filename)
    local class_name = vim.split(filename, "%.")[1]

    return [[
#ifndef ]] .. string.upper(class_name) .. [[_HPP
#define ]] .. string.upper(class_name) .. [[_HPP
#include <string>

class ]] .. class_name .. [[ 
{
private:
    // Add your private members here

public:
    //]] .. class_name .. [[(const std::string& arg); // In case you need to pass an  argument
//Orthodox canonical begin
    ]] .. class_name .. [[(void);
    ]] .. class_name .. [[(const ]] .. class_name .. [[& instance);
    ]] .. class_name .. [[ &operator=(const ]] .. class_name .. [[& rhs);
    ~]] .. class_name .. [[(void);
//Orthodox canonical end

    // Add your class members and methods here
};

std::ostream& operator<<(std::ostream& output, const ]] .. class_name .. [[& instance);

#endif // ]] .. string.upper(class_name) .. [[_HPP




//DEFINITION OF THE CLASS BELOW




#include "]] .. class_name .. [[.hpp"
#include <string>
//#include <ostream>

]] .. class_name .. [[::]] .. class_name .. [[(void) //: _init(some)
{
	std::cout << "]] .. class_name .. [[ Default constructor called" << std::endl; 
}

// In case you need to pass an  argument
//]] .. class_name .. [[::]] .. class_name .. [[(const std::string& arg) //: _init(arg)
//{
//	std::cout << "]] .. class_name .. [[ Constructor called" << std::endl; 
//}

]] .. class_name .. [[::]] .. class_name .. [[(const ]] .. class_name .. [[& instance)
{
	std::cout << "]] .. class_name .. [[ Copy constructor called" << std::endl; 
	operator=(instance);
}

]] .. class_name .. [[& ]] .. class_name .. [[::operator=(const ]] .. class_name .. [[& rhs)
{
	if (this != &rhs)
		{
			//implementation of the copying
		}
	return *this;
}

]] .. class_name .. [[::~]] .. class_name .. [[(void) //
{
	std::cout << "]] .. class_name .. [[ Destructor called" << std::endl; 
}

	//Further members implementations ..




	//output operator overload ..

std::ostream& operator<<(std::ostream& output, const ]] .. class_name .. [[& rhs)
{
	output << // implemetation <<;
	return output;
}
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
