import 'package:flutter/material.dart';

/// CustomPainter to create a ticket-like UI with rounded corners, cutouts, and a dotted line.
class TicketPainter extends CustomPainter {
  final Color borderColor; // Border color of the ticket
  final Color bgColor; // Background color of the ticket

  // Constants for corner and cutout styling
  static const _cornerGap = 10.0; // Radius of rounded corners
  static const _cutoutRadius = 10.0; // Radius of circular cutouts
  static const _cutoutDiameter = _cutoutRadius * 2.5; // Diameter of cutouts

  TicketPainter({required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width; // Ticket width
    final maxHeight = size.height; // Ticket height

    // Positioning for cutouts and dotted line
    final cutoutStartPos = maxHeight - maxHeight * 0.25; // Start position of the cutout
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;

    // Dotted line configuration
    const double dashWidth = 9;
    const double dashSpace = 5;
    const double dottedLinePadding = 16.0;
    final double dottedLineAdjustedStartX = _cutoutRadius + dottedLinePadding;
    final double dottedLineAdjustedEndX = maxWidth - _cutoutRadius - dottedLinePadding;

    // Paint for ticket background
    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    // Paint for ticket border
    final paintBorder = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    // Paint for dotted separator line
    final paintDottedLine = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.5;

    // Path to draw the ticket shape
    var path = Path();

    // Top left corner
    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);

    // Right cutout
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);

    // Bottom right corner
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);

    // Bottom left corner
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);

    // Left cutout
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);

    // Completing the path at the top left
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    // Adding a shadow for a 3D effect
    canvas.drawShadow(
      path,
      Colors.black.withOpacity(.4), // Shadow color
      4.0,
      true,
    );

    // Drawing the ticket background and border
    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    // Drawing the dotted separator line
    double dottedLineStartX = dottedLineAdjustedStartX;
    while (dottedLineStartX < dottedLineAdjustedEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  /// Draws a circular cutout at the given position.
  void _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  /// Draws a rounded corner at the given position.
  void _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}

// use 

CustomPaint(
        painter: TicketPainter(
          borderColor: Color(0xFF98DA98),
          bgColor: const Color(0xFFFFFFFF),
        ),
        child: Container(
          // content
        ),
), 