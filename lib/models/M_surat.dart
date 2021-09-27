class Surat {
  final String keterangan;
  final String asma;
  final String audio;
  final String nama;
  final String arti;

  const Surat({
    required this.keterangan,
    required this.asma,
    required this.audio,
    required this.nama,
    required this.arti,
  });

  factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        keterangan: json['keterangan'],
        asma: json['asma'],
        audio: json['audio'],
        nama: json['nama'],
        arti: json['arti'],
      );

  Map<String, dynamic> toJson() => {
        'keterangan': keterangan,
        'asma': asma,
        'audio': audio,
        'nama': nama,
      };
}
