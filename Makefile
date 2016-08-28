OBJS=
SUBOBJS=Exception/Exception.a
SUBDIRS=$(dir SUBOBJS)
BUILDPATH=./build
OBJPATHS=$(addprefix $(BUILDPATH)/, $(OBJS))
CPPFLAGS=$(INCLUDE) -fPIC -Wall -O2 -std=c++14 -MMD
LDFLAGS=-lstdc++
CXX=ccache clang++
TARGET=libcapacitypp.so
PREFIX=/usr/local/libcapacitypp

all: makefolder $(SUBOBJS) $(OBJPATHS)
	$(CXX) -shared -o $(TARGET) $(OBJPATHS) -Wl,--whole-archive $(SUBOBJS) -Wl,--no-whole-archive $(LDFLAGS)

$(SUBDIRS)/%.a:
	$(MAKE) -C $(dir $@)

$(BUILDPATH)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) -o $@ -c $<

makefolder:
	@mkdir -p $(BUILDPATH)

clean:
	@find . -maxdepth 2 | grep Makefile | grep -v samples | grep -v "\./Makefile" | xargs dirname | xargs -IXXXX $(MAKE) -C XXXX clean
	$(RM) $(TARGET)
	$(RM) -r -f $(BUILDPATH)

$(CLEANSUBDIRS):
	$(MAKE) -C $@ clean

install:
	@mkdir -p $(PREFIX)
	@mkdir -p $(PREFIX)/lib
	@cp $(TARGET) $(PREFIX)/lib
	@mkdir -p $(PREFIX)/include
	@find . -name "*.hpp" | xargs dirname | sed 's#\./#$(PREFIX)/include/#g' | xargs mkdir -p
	@find . -name "*.hpp" | sed 's#\./##g' | xargs -IXXXX cp XXXX $(PREFIX)/include/XXXX

-include $(BUILDPATH)/*.d

