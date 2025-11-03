import 'dart:ui';

/// The main colour palette
enum ColourPalette
{
  lightPink("ffd8cf"),
  orangeRed("f05226"),
  darkRed("bd3b27"),
  brownRed("6b1300"),
  lightMint("e2f7e6"),
  mint("c1e0c7"),
  green("84cc8f"),
  darkGreen("345136");

  const ColourPalette(this.hex);

  final String hex;

  /// transparency is in hex (ff for completely opaque)
  int asInt(String transparency)
  {
    return int.parse("0x$transparency$hex");
  }

  /// transparency is in hex (ff for completely opaque)
  Color asColorTransparency(String transparency)
  {
    return Color(asInt(transparency));
  }

  /// fully opaque
  Color asColor()
  {
    return asColorTransparency("ff");
  }
}