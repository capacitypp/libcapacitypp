OBJS=Exception.o
BUILDPATH=./build
OBJPATHS=$(addprefix $(BUILDPATH)/, $(OBJS))
LIBCAPACITYPPPREFIX=/usr/local/libcapacitypp
INCLUDE=$(addprefix -I,$(LIBCAPACITYPPPREFIX)/include)
CPPFLAGS=$(INCLUDE) -Wall -O2 -std=c++14 -MMD
LDFLAGS=-L$(LIBCAPACITYPPPREFIX)/lib -lstdc++ -lcapacitypp
CXX=ccache clang++
TARGET=Exception

all: makefolder $(OBJPATHS)
	$(CXX) -o $(TARGET) $(OBJPATHS) $(LDFLAGS)

$(BUILDPATH)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) -o $@ -c $<

makefolder:
	@mkdir -p $(BUILDPATH)

clean:
	$(RM) $(TARGET)
	$(RM) -r -f $(BUILDPATH)

-include $(BUILDPATH)/*.d

