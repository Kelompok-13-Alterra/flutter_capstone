import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class OrderWidget extends StatelessWidget {
  final String urlImg;
  final String title;
  final double rating;
  final String type;
  final String duration;
  final String status;
  final String route;
  final String buttonText1;
  final String routeButton1;
  final String buttonText2;
  final String routeButton2;
  const OrderWidget({
    super.key,
    required this.urlImg,
    required this.title,
    required this.rating,
    required this.type,
    required this.duration,
    required this.status,
    required this.route,
    required this.buttonText1,
    required this.routeButton1,
    required this.buttonText2,
    required this.routeButton2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            height: 184,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 89,
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(urlImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                      height: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: setTextStyle(BlackColor().black)
                          .copyWith(fontSize: 16,fontWeight: semiBold,)

                          ),

                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: SourceColor().yellow),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: setTextStyle(NeutralColor().neutral17)
                              .copyWith(fontSize: 13, fontWeight: medium),
                              ),

                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.business,
                                size: 14, color: NeutralColor().neutral60),
                            const SizedBox(width: 4),
                            Text(
                              type,
                              style: setTextStyle(NeutralColor().neutral60)
                              .copyWith(fontWeight: medium,fontSize: 12),

                              ),

                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 14, color: NeutralColor().neutral60),
                            const SizedBox(width: 4),
                            Text(
                              duration,
                            style: setTextStyle(NeutralColor().neutral60)
                              .copyWith(fontWeight: medium,fontSize: 12),
                              ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 8,
                  child: Container(
                    height: 28,
                    width: 81,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: TertiaryColor().tertiary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: setTextStyle(SourceColor().white)
                        .copyWith(fontWeight: medium , fontSize: 13),

                        ),
                      ),
                    ),
                  ),

                Positioned(
                  top: 98,
                  child: Wrap(
                    spacing: 5,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, routeButton1);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: SourceColor().white,
                            backgroundColor: PrimaryColor().primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(
                            buttonText1,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, routeButton2);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: buttonText2 == 'Cancel Book'
                                ? ErrorColor().error50
                                : PrimaryColor().primary,
                            backgroundColor: SourceColor().white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(
                                color: buttonText2 == 'Cancel Book'
                                    ? ErrorColor().error50
                                    : PrimaryColor().primary,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(buttonText2,
                              style: buttonText2 == 'Cancel Book'
                                  ? setTextStyle(ErrorColor().error50).copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    )
                                  : setTextStyle(PrimaryColor().primary)
                                      .copyWith(
                                      fontSize: 14,
                                      fontWeight: medium,
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
