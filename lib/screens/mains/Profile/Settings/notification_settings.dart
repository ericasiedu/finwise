import 'package:finwise/models/notify_settings.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  List<bool> switchValues = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize switchValues with false for all notify items
  //   switchValues = List.generate(notifyItems.length, (index) => false);
  // }

  @override
  void initState() {
    // TODO: implement initState
       if (switchValues.length != notifyItems.length) {
      switchValues = List.generate(
        notifyItems.length,
        (index) => index < 4  ? true : false, // default ON for index >= 4
      );
    }
  }

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
      title: 'Notification Settings',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notifyItems[index].notifyTitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                        value: switchValues[index],
                        activeColor: Colors.white,
                        activeTrackColor: primaryColor,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: inActivePrimaryColor,
                        onChanged: (bool value) {
                          setState(() {
                            switchValues[index] = value;
                          });
                        },
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 14),
                itemCount: notifyItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
