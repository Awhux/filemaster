# FileMaster

> A journey back to C/C++ through building an advanced command-line file manager

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: C++](https://img.shields.io/badge/Language-C%2B%2B-blue.svg)](https://isocpp.org/)

## 🎯 Project Overview

**FileMaster** is more than just a file manager—it's a deliberate return to systems programming fundamentals. After years of high-level web development with frameworks like React, Next.js, and Vue, this project represents a conscious effort to reconnect with manual memory management, system calls, and the raw power of C/C++.

### Why This Project?

As a senior web developer with 5+ years of experience, I found myself too comfortable in the abstracted world of modern frameworks. This project is my way of:

- **Rekindling the C/C++ flame** that once burned bright in my early programming days
- **Challenging myself** without the safety net of AI assistance
- **Sharing the learning journey** with the community
- **Building something genuinely useful** while leveling up

## ✨ Features

### 🚀 Current Features

- [ ] Basic directory navigation and file listing
- [ ] File operations (copy, move, delete, rename)
- [ ] Pattern-based file search with wildcards
- [ ] Detailed file information display

### 🔄 In Development

- [ ] Tree view for directory structures
- [ ] Built-in file compression/decompression
- [ ] Text and hex file viewers
- [ ] Bookmark system for favorite directories
- [ ] Batch operation queuing

### 🎯 Planned Features

- [ ] Configuration system with custom key bindings
- [ ] Performance optimization for large directories
- [ ] Cross-platform compatibility
- [ ] Plugin system for custom file handlers

## 🛠️ Technical Approach

### Core Principles

- **No AI assistance** - Pure problem-solving with Google, Stack Overflow, and documentation
- **Modern C++ practices** - Leveraging C++11/14 features while staying grounded
- **Memory safety first** - Every allocation tracked, every pointer validated
- **Performance conscious** - Optimized for real-world usage scenarios

### Architecture Highlights

- **Modular design** with clear separation of concerns
- **RAII resource management** for automatic cleanup
- **Defensive programming** with comprehensive error handling
- **Cross-platform system calls** for maximum compatibility

## 🚀 Getting Started

### Prerequisites

```bash
# Linux/Unix
sudo apt-get install build-essential  # Ubuntu/Debian
# or
sudo yum install gcc-c++              # RedHat/CentOS

# macOS
xcode-select --install
```

### Building

```bash
git clone https://github.com/Awhux/filemaster.git
cd filemaster
make clean && make
```

### Running

```bash
./filemaster [directory_path]
```

## 📈 Progress Tracking

### Development Phases

- **Phase 1** (Weeks 1-2): Foundation & Basic Operations
- **Phase 2** (Weeks 3-4): Advanced Features & Content Handling
- **Phase 3** (Weeks 5-6): Polish, Optimization & Documentation

### Learning Milestones

- [x] Project setup and build system
- [ ] Memory management without leaks
- [ ] Efficient directory traversal
- [ ] Cross-platform file operations
- [ ] Performance optimization techniques
- [ ] Comprehensive error handling

## 🤝 Community & Learning

### Following Along?

If you're interested in this learning journey:

1. **⭐ Star this repo** to follow progress updates
2. **🍴 Fork it** to start your own C/C++ challenge
3. **📝 Share insights** in issues or discussions
4. **🐛 Spot bugs?** Your fresh eyes are welcome!

### Learning Resources I'm Using

- **My mind**: Currently all knowledge is in my head, so I'm using it to learn.

### Study Notes & Insights

Check out the [`docs/learning-notes.md`](docs/learning-notes.md) file where I document:

### Experienced C/C++ Developers?

Your insights are invaluable! I'm especially interested in:

- **Code review feedback** on C++ best practices
- **Performance optimization suggestions**
- **Cross-platform compatibility tips**
- **Memory management pattern recommendations**

## 🤔 Philosophy

This project embodies the belief that **stepping backward can propel you forward**. By returning to fundamental programming concepts, we often gain a deeper appreciation for modern conveniences while sharpening skills that make us better developers overall.

Every segmentation fault is a lesson. Every memory leak caught is a victory. Every optimization discovered is growth.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
