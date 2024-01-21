/// Enum representing the configuration settings for the weather app.
enum ConfigSettings {
  /// The unit of measurement for temperature and other weather data.
  units,
}

/// Enumeration representing units of measurement.
enum Units {
  /// Metric units.
  metric(name: 'Metric'),

  /// Imperial units.
  imperial(name: 'Imperial');

  /// The name of the unit.
  final String name;

  /// Constructs a unit with the given name.
  const Units({required this.name});
}
