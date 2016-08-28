#include <iostream>

namespace Capacitypp {
	namespace Exception {
		class Exception : public std::exception {
		private:
			std::string file;
			int line;

		public:
			Exception(const std::string& file, int line);
			~Exception() throw();
			const char* what() const throw();
			std::string getFile(void) const;
			int getLine(void) const;
		};
	}
}

