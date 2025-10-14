class Permission {
  final String accessId;
  final String appId;
  final String accessName;
  final String accessDesc;

  Permission({
    required this.accessId,
    required this.appId,
    required this.accessName,
    required this.accessDesc,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      accessId: json['access_id'] ?? 0,
      appId: json['app_id'] ?? '',
      accessName: json['access_name'] ?? '',
      accessDesc: json['access_desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_id': accessId,
      'app_id': appId,
      'access_name': accessName,
      'access_desc': accessDesc,
    };
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
