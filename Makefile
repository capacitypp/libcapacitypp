OBJS=test.o
BUILDPATH=./build
OBJPATHS=$(addprefix $(BUILDPATH)/, $(OBJS))
CPPFLAGS=$(INCLUDE) -fPIC -Wall -O2 -std=c++14 -MMD
LDFLAGS=-lstdc++
CXX=ccache clang++
TARGET=libcapacitypp.so
PREFIX=/usr/local/libcapacitypp

all: makefolder $(OBJPATHS)
	$(CXX) -shared -o $(TARGET) $(OBJPATHS) $(LDFLAGS)

$(BUILDPATH)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) -o $@ -c $<

makefolder:
	@mkdir -p $(BUILDPATH)

clean:
	$(RM) $(TARGET)
	$(RM) -r -f $(BUILDPATH)

install:
	@mkdir -p $(PREFIX)
	@mkdir -p $(PREFIX)/lib
	@mkdir -p $(PREFIX)/include
	cp $(TARGET) $(PREFIX)/lib
	cp *.hpp $(PREFIX)/include

-include $(BUILDPATH)/*.d

