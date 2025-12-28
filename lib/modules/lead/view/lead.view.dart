import 'package:rgr/core/output/table.dart';
import 'package:rgr/modules/lead/model/lead.entity.dart';

export 'commands/leads.command.dart';

class LeadView {
  static void showLead(Lead lead) {
    final Map<String, dynamic> map = {
      'id': lead.id,
      'company_id': lead.companyId,
      'customer_id': lead.customerId,
      'status': lead.status,
      'created_at': lead.createdAt.toIso8601String(),
    };

    final table = ColumnValueTable();

    print(table.build(map.entries));
  }

  static void showLeads(List<Lead> leads) {
    final table = Table<Lead>(
      columns: {
        'id': (l) => l.id,
        'company_id': (l) => l.companyId,
        'customer_id': (l) => l.customerId,
        'status': (l) => l.status,
        'created_at': (l) => l.createdAt.toIso8601String(),
      },
    );

    print(table.build(leads));
  }
}
