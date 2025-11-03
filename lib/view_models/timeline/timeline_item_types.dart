import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:flutter/material.dart';

enum TimelineItemTypes
{
  click(Icons.ads_click, "Click", "%% Clicked", ColourPalette.green),
  pause(Icons.pause, "Pause", "Paused on %%", ColourPalette.orangeRed),
  close(Icons.close, "Close", "Application Closed", ColourPalette.darkRed);

  const TimelineItemTypes(this.icon, this.title, this.messageTemplate, this.colour);

  final IconData icon;
  final String title;
  final String messageTemplate;
  final ColourPalette colour;
}