```bash

#if i want to build a iOSApp 
bazel run //:iOSApp

#if i want to generate XCODE Project file to run in xcode
bazel run //:xcodeproj   

#just to build an app:
bazel build //:iOSApp 

```


# Swift Package Manager

## 1. Initialize Swift Package Manager
```bash
swift package init --type library
# This creates Package.swift
```

## 2. Generate Package.resolved
```bash
swift package resolve
# This creates Package.resolved with locked versions
```

## 3. Generate Bazel files from Swift packages
```bash
bazel run @rules_swift_package_manager//tools/swift_package_manager:update-packages
```

## 4. Build your project
```bash
bazel build //...
```

## 5. Run your binary
```bash
bazel run //:my_app
```
