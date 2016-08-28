#include <iostream>

#include <Exception/Exception.hpp>

using namespace Capacitypp;
using namespace Exception;

void func(void)
{
	throw Capacitypp::Exception::Exception();
}

int main(void)
{
	func();
	
	return 0;
}

