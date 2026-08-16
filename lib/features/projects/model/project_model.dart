class ProjectModel {
  final String? id;
  final String? name;
  final String? clientName;
  final String? deadline;
  final String? status;
  final double? progress; // Value between 0.0 and 1.0

  const ProjectModel({
    this.id,
    this.name,
    this.clientName,
    this.deadline,
    this.status,
    this.progress,
  });

  bool get isCompleted => status?.toLowerCase() == 'completed';
}