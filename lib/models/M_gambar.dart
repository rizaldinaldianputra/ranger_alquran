class Gambar {
  final String image;

  const Gambar({
    required this.image,
  });

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
      };
}
