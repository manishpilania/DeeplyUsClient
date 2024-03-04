class PartnershipActivityStatus {
  String id;
  Map<String, String> stages;

  PartnershipActivityStatus({required this.id, required this.stages});

  factory PartnershipActivityStatus.fromJson(Map<String, dynamic> json) {
    return PartnershipActivityStatus(
      id: json['id'],
      stages: Map<String, String>.from(json['Stages']),
    );
  }
}