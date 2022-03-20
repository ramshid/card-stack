import 'package:flutter/material.dart';

import '../constants.dart';

/// This widget is responsible for structuring the [NotificationCard].
class NotificationTile extends StatelessWidget {
  final String logo;
  final String purchaseDate;
  final String couponNo;
  final String drawDate;
  final String prize;
  final String product;
  final EdgeInsets? padding;
  final double height;
  final double spacing;

  const NotificationTile({
    Key? key,
    required this.couponNo,
    required this.logo,
    required this.purchaseDate,
    required this.drawDate,
    required this.prize,
    required this.product,
    required this.height,
    this.spacing = 0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x15000000),
            blurRadius: 12,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child:
                  Image.asset(logo, width: 120),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(prize,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blue)),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "Product: ",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: product,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "Purchased on: ",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                          text: purchaseDate,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "Coupon no: ",
                style: TextStyle(
                    color: Colors.grey.shade700, fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                      text: couponNo,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      )),
                ],
              ),
            ),
          ),
          const Divider(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.watch_later, color: Colors.grey.shade400),
                ),
                Text('Draw on ' + drawDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade400,
                    fontSize: 12,
                  ),
                )
                // const Text('closing in '),
                // CountdownTimer(
                //   endTime: endTime,
                //   widgetBuilder: (_, CurrentRemainingTime? time) {
                //     if (time == null) {
                //       return const Text('Campaign ended');
                //     }
                //     String days = time.days != null
                //         ? time.days.toString() + 'days '
                //         : '';
                //     String hours = time.hours != null
                //         ? time.hours.toString() + 'h : '
                //         : '';
                //     String minutes =
                //         time.min != null ? time.min.toString() + 'm : ' : '';
                //     String seconds =
                //         time.sec != null ? time.sec.toString() + 's' : '';
                //     return Text(
                //       '$days$hours$minutes$seconds',
                //       style: const TextStyle(fontWeight: FontWeight.bold),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
