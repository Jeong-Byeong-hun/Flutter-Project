import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final int maxRating;

  RatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
  });

  @override
  Widget build(BuildContext context) {
    int filledStars = (rating / 2).floor(); // 꽉찬 별
    int halfStars = ((rating - (filledStars * 2)) / 2)
        .round(); // 0.5를 넘으면 별 반개 or 안 넘으면 0으로 처리
    int emptyStars =
        maxRating - filledStars - halfStars; // 전체 별 - 꽉찬별 - 반개짜리 별 = 빈별

    String result = (rating / 2).toStringAsFixed(2);

    double roundedResult = double.parse(result);
    print(
        'Rounded result: ${roundedResult.toStringAsFixed(2)}'); // 결과를 소수점 2자리에서 반올림하여 출력

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < filledStars; i++)
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        if (halfStars == 1)
          const Icon(
            Icons.star_half,
            color: Colors.yellow,
          ),
        for (int i = 0; i < emptyStars; i++)
          const Icon(
            Icons.star_border,
            color: Colors.yellow,
          ),
        const SizedBox(
          width: 10,
        ),
        Text(
          '${roundedResult.toStringAsFixed(2)} 점',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
