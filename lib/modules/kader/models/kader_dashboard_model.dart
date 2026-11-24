class KaderDashboardModel {
  final List<PosyanduSummary> posyandu;
  final KaderDashboardStatistics statistics;

  KaderDashboardModel({required this.posyandu, required this.statistics});

  factory KaderDashboardModel.fromJson(Map<String, dynamic> json) {
    return KaderDashboardModel(
      posyandu: (json['posyandu'] as List? ?? [])
          .map(
            (item) => PosyanduSummary.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList(),
      statistics: KaderDashboardStatistics.fromJson(
        Map<String, dynamic>.from(json['statistics'] ?? {}),
      ),
    );
  }
}

class PosyanduSummary {
  final int id;
  final String nama;

  PosyanduSummary({required this.id, required this.nama});

  factory PosyanduSummary.fromJson(Map<String, dynamic> json) {
    return PosyanduSummary(
      id: int.tryParse('${json['id']}') ?? 0,
      nama: json['nama']?.toString() ?? '-',
    );
  }
}

class KaderDashboardStatistics {
  final int totalWarga;
  final int totalKegiatan;
  final int kunjunganHariIni;
  final int antreanMenunggu;

  KaderDashboardStatistics({
    required this.totalWarga,
    required this.totalKegiatan,
    required this.kunjunganHariIni,
    required this.antreanMenunggu,
  });

  factory KaderDashboardStatistics.fromJson(Map<String, dynamic> json) {
    return KaderDashboardStatistics(
      totalWarga: int.tryParse('${json['total_warga']}') ?? 0,
      totalKegiatan: int.tryParse('${json['total_kegiatan']}') ?? 0,
      kunjunganHariIni: int.tryParse('${json['kunjungan_hari_ini']}') ?? 0,
      antreanMenunggu: int.tryParse('${json['antrean_menunggu']}') ?? 0,
    );
  }
}
