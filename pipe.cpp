#include <unistd.h>

#include "zip_file.hpp"

int main(int argc, char *argv[])
{
    zip_file file;
    std::vector<std::string> args;
    
    for(int i = 1; i < argc; i++)
    {
        args.push_back(argv[i]);
    }
    
    if(isatty(fileno(stdin)))
    {
        file.load(args.front());
        args.erase(args.begin());
    }
    else
    {
        file.load(std::cin);
    }
    
    if(args.empty())
    {
        file.printdir();
    }
    else
    {
        std::cout << file.read(args.front()) << std::endl;
    }
    
    return 0;
}
