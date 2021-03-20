class Parameter {
  final String name;
  final String value;
  final String unit;

  Parameter(this.name, this.value, {this.unit});

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(json['name'], json['value'], unit: json['unit']);
  }
}
