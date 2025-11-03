import 'dart:ui';

import 'package:caremixer_technical_assesment/views/colour_palette/colour_palette.dart';
import 'package:test/test.dart';

void main() {
  test('ColourPalette .asColor() should return fully opaque color object', () {

    expect(ColourPalette.brownRed.asColor(), Color(0xff6b1300));
  });

  test('ColourPalette .asInt() should match transparency', () {

    expect(ColourPalette.lightMint.asInt("A0"), 0xA0e2f7e6);
  });

  test('ColourPalette .asColorTransparency() should match transparency', () {

    expect(ColourPalette.darkGreen.asColorTransparency("54"), Color(0x54345136));
  });
}