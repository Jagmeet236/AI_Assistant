class OnBoard {
  final String title;
  final String subtitle;
  final String lottie;
  OnBoard({
    required this.title,
    required this.subtitle,
    required this.lottie,
  });

  OnBoard copyWith({
    String? title,
    String? subtitle,
    String? lottie,
  }) {
    return OnBoard(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      lottie: lottie ?? this.lottie,
    );
  }
}
