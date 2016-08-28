#include "Exception_definition.hpp"

using namespace std;
using namespace Capacitypp;
using namespace Exception;

Capacitypp::Exception::Exception::Exception(const string& file, int line)
	: file(file), line(line)
{

}

Capacitypp::Exception::Exception::~Exception() throw()
{

}

const char* Capacitypp::Exception::Exception::what() const throw()
{
	string str;
	str += "\nfile : ";
	str += file;
	str += "\nline : ";
	str += to_string(line);
	return str.c_str();
}

string Capacitypp::Exception::Exception::getFile(void) const
{
	return file;
}

int Capacitypp::Exception::Exception::getLine(void) const
{
	return line;
}

