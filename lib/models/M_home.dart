class Surat {
  final String keterangan;
  final String asma;
  final String audio;
  final String nama;

  const Surat({
    required this.keterangan,
    required this.asma,
    required this.audio,
    required this.nama,
  });

  factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        keterangan: json['keterangan'],
        asma: json['asma'],
        audio: json['audio'],
        nama: json['nama'],
      );

  Map<String, dynamic> toJson() => {
        'keterangan': keterangan,
        'asma': asma,
        'audio': audio,
        'nama': nama,
      };
}
