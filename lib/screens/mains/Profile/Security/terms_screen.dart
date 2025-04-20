import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return primaryColor;
      }
      return primaryColor;
    }

    return ContainerWrapper(
      showAppBar: true,
      title: 'Terms And Conditions',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Est fugiat assumenda aut reprehenderit Lorem ipsum dolor sit amet. Et odio officia aut '
              'voluptate internos est omnis vitae ut architecto sunt non tenetur fuga ut provident vero. Quo'
              'aspernatur facere et consectetur ipsum et facere corrupti est asperiores facere. Est'
              'fugiat assumenda aut reprehenderit voluptatem sed. Ea voluptates omnis aut sequi sequi.'
              'Est dolore quae in aliquid ducimus et autem repellendus. Aut ipsum Quis qui porro quasi aut'
              'minus placeat! Sit consequatur neque ab vitae facere. Aut quidem accusantium nam alias autem eum'
              'officiis placeat et omnis autem id officiis perspiciatis qui corrupti officia eum aliquam provident.'
              'Eum voluptas error et optio dolorum cum molestiae nobis et odit molestiae quo magnam impedit sed '
              'fugiat nihil non nihil vitae. Aut fuga sequi eum voluptatibus provident.Eos consequuntur voluptas'
              'vel amet eaque aut dignissimos velit. Vel exercitationem quam vel eligendi rerum At harum obcaecati'
              'et nostrum beatae? Ea accusantium dolores qui rerum aliquam est perferendis mollitia et ipsum ipsa qui '
              'enim autem At corporis sunt. Aut odit quisquam est reprehenderit itaque aut accusantium dolor qui neque repellat.',
            ),
            SizedBox(height: 20),
            Text('Read the terms and conditions in more detail at'),
            SizedBox(height: 10),
            Text('www.finwiseapp.de', style: TextStyle(color: oceanBlue)),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: WidgetStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(width: 5),
                Text('I accept all the terms and conditions'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
