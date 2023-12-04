class Transaction {
  final int id;
  final DateTime dateCheckin;
  final String invoiceNumber;
  final int qtyTicket;

  Transaction({required this.id, required this.dateCheckin, required this.invoiceNumber, required this.qtyTicket});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? 0,
      dateCheckin: json['date_checkin'] ?? '',
      invoiceNumber: json['invoice_number'] ?? '',
      qtyTicket: json['qty_ticket'] ?? 0
    );
  }
}
