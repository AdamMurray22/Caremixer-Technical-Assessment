class Pokemon
{
  final String name;
  final String uri;
  final int pokedexEntry;

  Pokemon(this.name, this.uri, this.pokedexEntry);

  /// Returns the name with the first character capitalised.
  String get displayName => name.capitalize();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}