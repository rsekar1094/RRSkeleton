# 🦴 ShimmeringSkeleton

A lightweight and customizable SwiftUI `ViewModifier` that adds a **shimmering skeleton loader** to *any* view with just one line of code.

Perfect for indicating loading states with style ✨

---

## 📸 Preview
![ScreenRecording2025-04-15at7 28 19PM-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/52c05def-7258-4610-b858-76735bd7155f)


---

## 🚀 Features

- ✅ Native SwiftUI Modifier
- ✅ Supports light & dark mode automatically
- ✅ Customizable animation & shimmer angle
- ✅ No external dependencies
- ✅ One-liner usage

---

## 🧩 Usage

### 1. Add the Modifier

Copy `SkeletonModifier.swift` to your SwiftUI project.

### 2. Use it like this:

```swift
Text("Loading something cool...")
    .skeleton(isOn: true)
```

⚙️ Customization (Advanced)
If you want to tweak animation or shimmer angle:

```swift
SkeletonModifier(
    isRedacted: true,
    animation: .easeInOut(duration: 2).repeatForever(autoreverses: false),
    rotationAngle: .degrees(20)
)
```

But honestly, the defaults are pretty sweet already 😎

---

🙋‍♂️ Author
Made with ❤️ by Rajasekhar Rajendran
