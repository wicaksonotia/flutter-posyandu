class HomeStatModel {
  final int totalWarga;
  final int kunjunganBulanIni;
  final int kegiatanAktif;
  final int posyanduAktif;

  const HomeStatModel({
    required this.totalWarga,
    required this.kunjunganBulanIni,
    required this.kegiatanAktif,
    required this.posyanduAktif,
  });

  factory HomeStatModel.fromJson(Map<String, dynamic> json) {
    return HomeStatModel(
      totalWarga: json['total_warga'] ?? 0,
      kunjunganBulanIni: json['kunjungan_bulan_ini'] ?? 0,
      kegiatanAktif: json['kegiatan_aktif'] ?? 0,
      posyanduAktif: json['posyandu_aktif'] ?? 0,
    );
  }
}
