import 'package:flutter/material.dart';
import '../model/notification_card.dart';

/// [LastNotificationCard] is the topmost card on the stack

class LastNotificationCard extends StatelessWidget {
  final AnimationController controller;
  final NotificationCard notification;
  final int totalCount;
  final double height;
  final double padding;

  const LastNotificationCard({
    Key? key,
    required this.controller,
    required this.notification,
    required this.totalCount,
    required this.height,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: totalCount > 1 && controller.value <= 0.4,
      child: GestureDetector(
        key: ValueKey('onTapExpand'),
        onTap: () {
          controller.forward();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16),
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
          child: Stack(
            children: [
              Column(
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
                          Image.asset(notification.logo, width: 120),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(notification.prize,
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
                                  text: notification.product,
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
                                  text: notification.purchaseDate,
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
                              text: notification.couponNo,
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
                        Text('Draw on ' + notification.drawDate,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
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
              Positioned(
                right: 16,
                top: 16,
                child: Opacity(
                  opacity: Tween(begin: 1.0, end: 0.0)
                      .animate(
                    CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 0.2),
                    ),
                  )
                      .value,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff00be7e),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2, bottom: 2),
                      child: Text(
                        totalCount.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
