class PuskesmasDashboardModel {
  final int totalDesa;
  final int totalPosyandu;
  final int totalWarga;
  final int totalKegiatan;

  PuskesmasDashboardModel({
    required this.totalDesa,
    required this.totalPosyandu,
    required this.totalWarga,
    required this.totalKegiatan,
  });

  factory PuskesmasDashboardModel.fromJson(Map<String, dynamic> json) {
    return PuskesmasDashboardModel(
      totalDesa: json['total_desa'] ?? 0,
      totalPosyandu: json['total_posyandu'] ?? 0,
      totalWarga: json['total_warga'] ?? 0,
      totalKegiatan: json['total_kegiatan'] ?? 0,
    );
  }
}
