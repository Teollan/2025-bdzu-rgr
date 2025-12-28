class Lead {
  final int id;
  final int companyId;
  final int customerId;
  final String status;
  final DateTime createdAt;

  Lead({
    required this.id,
    required this.companyId,
    required this.customerId,
    required this.status,
    required this.createdAt,
  });
}
