# Contributing to ResumeApp

Thank you for your interest in contributing to ResumeApp! This document provides guidelines and instructions for contributing to this Qt WebAssembly resume application project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [How to Contribute](#how-to-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features](#suggesting-features)
  - [Code Contributions](#code-contributions)
- [Coding Standards](#coding-standards)
- [Pull Request Process](#pull-request-process)
- [Project Structure](#project-structure)

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## Getting Started

Before you begin:
- Make sure you have a [GitHub account](https://github.com/signup/free)
- Check existing issues and pull requests to see if your idea or bug has already been reported
- Read this guide completely

## Development Setup

### Prerequisites

1. **Qt 6.6.1 or later** - [Download Qt](https://www.qt.io/download)
2. **Emscripten SDK** - Required for WebAssembly compilation
   - Follow the [official Qt documentation](https://doc.qt.io/qt-6/wasm.html) for installation instructions
3. **CMake 3.21.1 or later**
4. **Git** - For version control
5. **Qt Creator** (recommended) or your preferred IDE

### Setting Up the Development Environment

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/ResumeAppWeb.git
   cd ResumeAppWeb
   ```

2. **Configure Emscripten in Qt Creator:**
   - Open Qt Creator
   - Go to Tools → Options → Kits → Environment
   - Set the Emscripten path in your environment variables

3. **Build the project:**
   ```bash
   mkdir build
   cd build
   cmake ..
   cmake --build .
   ```

4. **Test the build:**
   - After building, you should see output files: `ResumeAppApp.html`, `ResumeAppApp.js`, `ResumeAppApp.wasm`, and `qtloader.js`
   - Run a local HTTP server to test:
     ```bash
     python -m http.server 8000
     ```
   - Open `http://localhost:8000/ResumeAppApp.html` in your browser

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with the following information:

- **Description**: Clear description of the bug
- **Steps to Reproduce**: Detailed steps to reproduce the issue
- **Expected Behavior**: What you expected to happen
- **Actual Behavior**: What actually happened
- **Environment**:
  - Qt version
  - Emscripten version
  - Operating system
  - Browser (if applicable)
- **Screenshots**: If applicable, include screenshots or error messages

### Suggesting Features

Feature suggestions are welcome! Please create an issue with:

- **Clear description** of the feature
- **Use case**: Why this feature would be useful
- **Possible implementation**: If you have ideas on how to implement it (optional)

### Code Contributions

1. **Fork the repository** on GitHub

2. **Create a branch** for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-description
   ```

3. **Make your changes** following the [Coding Standards](#coding-standards)

4. **Test your changes**:
   - Build the project successfully
   - Test in the browser
   - Verify JSON format if you modified data structures

5. **Commit your changes** with clear commit messages:
   ```bash
   git commit -m "Add: Description of your change"
   git commit -m "Fix: Description of bug fix"
   git commit -m "Update: Description of update"
   ```

6. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request** on GitHub with:
   - Clear title and description
   - Reference any related issues
   - Include screenshots if UI changes were made

## Coding Standards

### C++ Code Style

- Follow Qt coding conventions
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and small
- Use camelCase for functions and variables
- Use PascalCase for classes

Example:
```cpp
class DataJson {
public:
    QString getData() const;
    void setData(const QString& data);
private:
    QString m_data;
};
```

### QML Code Style

- Use consistent indentation (4 spaces recommended)
- Group properties logically (id, anchors, properties, signals, etc.)
- Use descriptive component and property names
- Follow Qt QML best practices
- Keep components reusable when possible

Example:
```qml
Item {
    id: rootItem
    
    anchors.fill: parent
    
    property string title: ""
    property color backgroundColor: "#ffffff"
    
    signal clicked()
    
    Rectangle {
        anchors.fill: parent
        color: rootItem.backgroundColor
        
        Text {
            text: rootItem.title
            anchors.centerIn: parent
        }
    }
}
```

### JSON Format

When modifying `resume.json`, follow the existing format:

- Use consistent indentation (4 spaces)
- Ensure proper JSON syntax (no trailing commas)
- Keep field names lowercase with underscores or camelCase as per existing style
- Validate JSON before committing

Example structure:
```json
{
    "about": [
        {
            "information": [
                {
                    "name": "",
                    "family": "",
                    "age": "",
                    "phone": "",
                    "location": "",
                    "about": ""
                }
            ]
        }
    ],
    "jobs": [
        {
            "job": "",
            "company": "",
            "image": ""
        }
    ],
    "education": [
        {
            "education": "",
            "univesity": "",
            "Orientation": "",
            "image": ""
        }
    ]
}
```

## Pull Request Process

1. **Ensure your code builds successfully** without warnings
2. **Update documentation** if you've changed functionality
3. **Update the README.md** if you've changed setup instructions
4. **Follow the commit message conventions**:
   - `Add:` for new features
   - `Fix:` for bug fixes
   - `Update:` for updates to existing features
   - `Refactor:` for code refactoring
   - `Docs:` for documentation changes

5. **Wait for review** - Maintainers will review your PR
6. **Address feedback** - Make requested changes if needed
7. **Once approved**, your PR will be merged

## Project Structure

```
ResumeAppWeb/
├── src/                    # C++ source files
│   ├── main.cpp           # Application entry point
│   ├── datajson.cpp/h     # JSON data handling
│   └── app_environment.h  # Environment configuration
├── content/               # QML UI components
│   ├── App.qml           # Main application component
│   ├── About.ui.qml      # About section
│   ├── Jobs.qml          # Jobs section
│   ├── Education.qml     # Education section
│   ├── Skills.qml        # Skills section
│   └── image/            # Image assets
├── imports/               # QML modules and components
│   └── ResumeApp/        # Custom QML components
├── build/                 # Build output directory
├── CMakeLists.txt        # CMake build configuration
├── resume.json           # Resume data (JSON format)
└── res.qrc              # Qt resource file
```

### Key Files

- **QML Files**: UI components in `content/` directory
- **C++ Files**: Core logic in `src/` directory
- **JSON Data**: Resume data in `resume.json`
- **CMakeLists.txt**: Build configuration
- **res.qrc**: Resource file bundling assets

## Questions?

If you have questions about contributing, please:
- Open an issue with the `question` label
- Check existing issues and discussions
- Review the README.md for project information

Thank you for contributing to ResumeApp! 🎉

