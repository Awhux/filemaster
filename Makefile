# FileMaster - Cross-platform Makefile
CXX = g++
CXXFLAGS = -std=c++14 -Wall -Wextra -Werror -pedantic -g
LDFLAGS =

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TARGET = filemaster

# Cross-platform recursive wildcard function
rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

# Source files (cross-platform recursive search)
SOURCES = $(call rwildcard,$(SRCDIR),*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

# Platform detection
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
    CXXFLAGS += -D WINDOWS
    MKDIR = if not exist "$(subst /,\,$(1))" mkdir "$(subst /,\,$(1))"
    RM = if exist "$(subst /,\,$(1))" rmdir /s /q "$(subst /,\,$(1))"
    RMFILE = if exist "$(subst /,\,$(1))" del /q "$(subst /,\,$(1))"
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        DETECTED_OS := Linux
        CXXFLAGS += -D LINUX
    endif
    ifeq ($(UNAME_S),Darwin)
        DETECTED_OS := Darwin
        CXXFLAGS += -D OSX
    endif
    MKDIR = mkdir -p $(1)
    RM = rm -rf $(1)
    RMFILE = rm -f $(1)
endif

# Default target
all: $(TARGET)

# Create build directory
$(BUILDDIR):
	$(call MKDIR,$(BUILDDIR))

# Link
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

# Compile
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	@$(call MKDIR,$(dir $@))
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
	$(call RM,$(BUILDDIR))
	$(call RMFILE,$(TARGET))

format:
ifeq ($(DETECTED_OS),Windows)
	@for /r $(SRCDIR) %%f in (*.cpp *.h) do @clang-format -i "%%f"
	@for /r $(INCDIR) %%f in (*.cpp *.h) do @clang-format -i "%%f"
else
	find $(SRCDIR) $(INCDIR) -name "*.cpp" -o -name "*.h" | xargs clang-format -i
endif

info:
	@echo "Detected OS: $(DETECTED_OS)"
	@echo "Sources found: $(SOURCES)"

help:
	@echo "Available targets:"
	@echo "  all              Build the project (cross-platform)"
	@echo "  debug            Build with debug flags"
	@echo "  release          Build with optimization"
	@echo "  clean            Remove build files"
	@echo "  lint             Run clang-tidy"
	@echo "  static-analysis  Run cppcheck"
	@echo "  format           Format code with clang-format"
	@echo "  info             Show detected OS and found sources"

.PHONY: all debug release clean lint static-analysis format help info
