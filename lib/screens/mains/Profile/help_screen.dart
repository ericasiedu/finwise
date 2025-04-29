import 'package:finwise/models/faq_data.dart';
import 'package:finwise/models/support_data.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late List<FaqData> items = faqItems;

  @override
  void initState() {
    super.initState();
    items = List.from(faqItems); // Initialize in initState
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
      title: 'Help & FAQs',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      'How Can We Help You?',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    indicator: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    tabs: const [Tab(text: 'FAQ'), Tab(text: 'Contact Us')],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('General', style: TextStyle(fontSize: 18)),
                                Text('Account', style: TextStyle(fontSize: 18)),
                                Text(
                                  'Services',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightGreen,
                        hintText: 'Search....',
                        hintStyle: TextStyle(color: placeHolderColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ];
          },
          body: SizedBox(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        items[index].isExpandible = !items[index].isExpandible;
                      });
                    },
                    children:
                        items.map<ExpansionPanel>((FaqData item) {
                          return ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: lightGreenBg,
                            headerBuilder: (
                              BuildContext context,
                              bool isExpanded,
                            ) {
                              return Container(
                                color: lightGreenBg,
                                child: ListTile(title: Text(item.headerTitle)),
                              );
                            },
                            body: Container(
                              color: lightGreenBg,
                              child: ListTile(title: Text(item.bodyContent)),
                            ),
                            isExpanded: item.isExpandible,
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 50),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Image.asset(
                                supportItems[index].icon,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Expanded(child: Text(supportItems[index].menuName,style: TextStyle(fontSize: 17),),),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios, size: 14,),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 25),
                    itemCount: supportItems.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _TabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: lightGreen, // Adjust to match your design
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(7),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
