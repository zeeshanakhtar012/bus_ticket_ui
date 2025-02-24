# 🎟️ TicketPainter - Custom Ticket UI in Flutter

`TicketPainter` is a **CustomPainter** implementation in Flutter that creates a ticket-like UI with rounded corners, cutout effects, and a dotted separator line.

## ✨ Features
- 🎨 Customizable background and border colors
- ✂️ Rounded corners and cutout sections for a ticket-style look
- 📏 Dotted separator line for a perforated effect
- 🔄 Optimized drawing with `CustomPainter` for better performance

## 📸 Preview
*(Add an image or GIF of the ticket design here for better visualization)*

## 🚀 Usage

### 1️⃣ **Add the `TicketPainter` to Your Widget**
Use the `CustomPaint` widget and provide `TicketPainter` as the `painter`.

```dart
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 150), // Adjust size as needed
      painter: TicketPainter(
        bgColor: Colors.white,
        borderColor: Colors.black,
      ),
    );
  }
}
```

### 2️⃣ **Customize the Colors**
Modify the `bgColor` and `borderColor` in `TicketPainter` to match your theme.

```dart
TicketPainter(
  bgColor: Colors.redAccent,   // Background color
  borderColor: Colors.black,   // Border color
)
```

## 📌 Implementation Details
The `TicketPainter` class:
- Uses **CustomPainter** to draw a ticket-like shape.
- Creates **rounded corners** for a smooth design.
- Adds **cutout sections** on both sides to resemble a real ticket.
- Draws a **dotted separator line** to mimic a tearable ticket.

## 🔧 Dependencies
No external dependencies are required—just **Flutter's `CustomPainter` API`**.

## 🤝 Contributing
Feel free to contribute! If you improve this design, submit a pull request. 🚀

## 📜 License
This project is open-source and free to use under the **MIT License**.

---

🔹 **Made with ❤️ in Flutter** 🔹
