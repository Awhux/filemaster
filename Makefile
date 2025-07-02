# FileMaster - Cross-platform Makefile
CXX = g++
CXXFLAGS = -std=c++14 -Wall -Wextra -Werror -pedantic -g
LDFLAGS =

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TARGET = filemaster

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Platform detection
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    CXXFLAGS += -D LINUX
endif
ifeq ($(UNAME_S),Darwin)
    CXXFLAGS += -D OSX
endif

# Default target
all: $(TARGET)

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Link
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

# Compile
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -I$(INCDIR) -c $< -o $@

# Development targets
debug: CXXFLAGS += -DDEBUG -O0
debug: $(TARGET)

release: CXXFLAGS += -DNDEBUG -O3
release: $(TARGET)

lint:
	@echo "Running clang-tidy..."
	@clang-tidy $(SOURCES) -- $(CXXFLAGS) -I$(INCDIR)

static-analysis:
	@echo "Running cppcheck..."
	@cppcheck --enable=all --std=c++14 --language=c++ $(SRCDIR)/

clean:
	rm -rf $(BUILDDIR) $(TARGET)

format:
	find $(SRCDIR) $(INCDIR) -name "*.cpp" -o -name "*.h" | xargs clang-format -i

help:
	@echo "Available targets:"
	@echo "  all              Build the project"
	@echo "  debug            Build with debug flags"
	@echo "  release          Build with optimization"
	@echo "  clean            Remove build files"
	@echo "  lint             Run clang-tidy"
	@echo "  static-analysis  Run cppcheck"
	@echo "  format           Format code with clang-format"

.PHONY: all debug release clean lint static-analysis format help
