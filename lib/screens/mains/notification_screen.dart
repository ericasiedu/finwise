import 'package:finwise/models/notification_data.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    return ContainerWrapper(
      showAppBar: true,
      title: 'Notification',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 30)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NotificationCard(
                    icon: dailyNotifications[index].icon,
                    title: dailyNotifications[index].title,
                    contents: dailyNotifications[index].contents,
                    time: dailyNotifications[index].time,
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 25),
                itemCount: dailyNotifications.length,
              ),
            ),
            SizedBox(height: 20),
            Text('Yesterday', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NotificationCard(
                    icon: yesterdayNotifications[index].icon,
                    title: yesterdayNotifications[index].title,
                    contents: yesterdayNotifications[index].contents,
                    time: yesterdayNotifications[index].time,
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 25),
                itemCount: yesterdayNotifications.length,
              ),
            ),
            SizedBox(height: 20),
            Text('This Weekend', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NotificationCard(
                    icon: weekNotifications[index].icon,
                    title: weekNotifications[index].title,
                    contents: weekNotifications[index].contents,
                    time: weekNotifications[index].time,
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 25),
                itemCount: weekNotifications.length,
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
