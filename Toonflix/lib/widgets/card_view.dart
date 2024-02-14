import 'package:flutter/material.dart';

class card_view extends StatelessWidget {
  final String startHour, startMin, endHour, endMin, title;
  final List<String> items;
  final Color bgColor;

  const card_view({
    super.key,
    required this.startHour,
    required this.startMin,
    required this.endHour,
    required this.endMin,
    required this.title,
    required this.items,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          startHour,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          startMin,
                          style: const TextStyle(
                            fontSize: 10,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 1,
                          height: 10,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          endHour,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          endMin,
                          style: const TextStyle(
                            fontSize: 10,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: items.map((item) {
                            return Row(
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(
                                    color: item == 'ME'
                                        ? Colors.black
                                        : Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ],
                ))),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
