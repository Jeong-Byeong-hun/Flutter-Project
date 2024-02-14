import 'package:flutter/material.dart';
import 'package:toonflix/widgets/card_view.dart';
import 'package:toonflix/widgets/gray_text.dart';

class App1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 8,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundImage: ExactAssetImage('images/ryo.jpg'),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'MONDAY 16',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                10,
                                (index) => Container(
                                  width: 50,
                                  height: 50,
                                  child: gray_text(text: '${index + 17}'),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    card_view(
                      startHour: '11',
                      startMin: '30',
                      endHour: '12',
                      endMin: '20',
                      title: 'DESIGN\nMEETING',
                      items: ['ALLEX', 'HELENA', 'NANA'],
                      bgColor: Colors.amberAccent,
                    ),
                    card_view(
                      startHour: '12',
                      startMin: '35',
                      endHour: '14',
                      endMin: '10',
                      title: 'DAILY\nPROJECT',
                      items: ['ME', 'RICHARD', 'CIRY', '+4'],
                      bgColor: Colors.deepPurple,
                    ),
                    card_view(
                      startHour: '15',
                      startMin: '00',
                      endHour: '16',
                      endMin: '30',
                      title: 'WEEKLY\nPLANNING',
                      items: ['DEN', 'NANA', 'MARK'],
                      bgColor: Colors.lightGreenAccent,
                    ),
                    card_view(
                      startHour: '16',
                      startMin: '15',
                      endHour: '17',
                      endMin: '20',
                      title: '하루의\n마무리',
                      items: ['ME', 'YOU', 'WE', '+9'],
                      bgColor: Colors.greenAccent,
                    ),
                    card_view(
                      startHour: '18',
                      startMin: '30',
                      endHour: '18',
                      endMin: '40',
                      title: '퇴근하자\n오늘도수고했어',
                      items: ['OUR'],
                      bgColor: Colors.blue,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
