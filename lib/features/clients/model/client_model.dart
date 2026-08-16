class ClientModel {
  final String? id;
  final String? companyName;
  final String? contactPerson;
  final String? email;
  final String? country;
  final int? projectCount;
  final String? status;

  const ClientModel({
    this.id,
    this.companyName,
    this.contactPerson,
    this.email,
    this.country,
    this.projectCount,
    this.status,
  });

  bool get isActive => status?.toLowerCase() == 'active';
}