class SaleInvoiceModel {
  final int statusCode;
  final List<SalesInvoice> data;
  final int totalCount;

  SaleInvoiceModel({
    required this.statusCode,
    required this.data,
    required this.totalCount,
  });

  factory SaleInvoiceModel.fromJson(Map<String, dynamic> json) {
    return SaleInvoiceModel(
      statusCode: json['StatusCode'],
      data: List<SalesInvoice>.from(
        json['data'].map((x) => SalesInvoice.fromJson(x)),
      ),
      totalCount: json['total_count'],
    );
  }
}

class SalesInvoice {
  final int index;
  final String id;
  final String voucherNo;
  final String date;
  final String ledgerName;
  final double totalGrossAmount;
  final double totalTaxRounded;
  final double grandTotalRounded;
  final String customerName;
  final double totalTax;
  final String status;
  final double grandTotal;
  final bool isBillWised;
  final String billwiseStatus;

  SalesInvoice({
    required this.index,
    required this.id,
    required this.voucherNo,
    required this.date,
    required this.ledgerName,
    required this.totalGrossAmount,
    required this.totalTaxRounded,
    required this.grandTotalRounded,
    required this.customerName,
    required this.totalTax,
    required this.status,
    required this.grandTotal,
    required this.isBillWised,
    required this.billwiseStatus,
  });

  factory SalesInvoice.fromJson(Map<String, dynamic> json) {
    return SalesInvoice(
      index: json['index'],
      id: json['id'],
      voucherNo: json['VoucherNo'],
      date: json['Date'],
      ledgerName: json['LedgerName'],
      totalGrossAmount: (json['TotalGrossAmt_rounded'] ?? 0).toDouble(),
      totalTaxRounded: (json['TotalTax_rounded'] ?? 0).toDouble(),
      grandTotalRounded: (json['GrandTotal_Rounded'] ?? 0).toDouble(),
      customerName: json['CustomerName'],
      totalTax: (json['TotalTax'] ?? 0).toDouble(),
      status: json['Status'],
      grandTotal: (json['GrandTotal'] ?? 0).toDouble(),
      isBillWised: json['is_billwised'] ?? false,
      billwiseStatus: json['billwise_status'],
    );
  }
}
