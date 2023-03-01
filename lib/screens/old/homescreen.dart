import 'package:audit_finance_app/constant/temp_data.dart';
import 'package:audit_finance_app/constant/theme.dart';
import 'package:audit_finance_app/providers/states.dart';
import 'package:audit_finance_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bankAccount = 1;
  int savingsAccount = 2;

  @override
  void initState() {
    final statesData = Provider.of<States>(context, listen: false);
    statesData.screen = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          Widgets().gradientAppBar(
            title: const CircleAvatar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/header_one.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Widgets().sizedBoxHeight(20),
                              Widgets().headerTitle('Total Balance'),
                              Widgets().sizedBoxHeight(15),
                              Widgets().headerText('\$1,234.00'),
                              Widgets().sizedBoxHeight(10),
                              const Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('+ \$1,234.00'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'LATEST TRANSACTIONS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 130.0,
                      child: Card(
                        color: TempData.transactionColor[index],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TempData.transactionName[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Widgets().sizedBoxHeight(3),
                              Text(
                                TempData.transactionValue[index],
                                style: const TextStyle(
                                  fontSize: 17.5,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                TempData.transactionType[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(140, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Widgets().divider(),
          Widgets().transactionTitle(text: 'Payment'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index != bankAccount - 1
                            ? Colors.grey
                            : Colors.transparent,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 40,
                      color: AuditTheme.primaryColor,
                    ),
                    title: Text('Bank Account'),
                    subtitle: Text('NDSL RA01 203 4455 12'),
                    trailing: Text(
                      '\$30,234',
                      style: TextStyle(
                        color: AuditTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
          Widgets().divider(),
          Widgets().transactionTitle(text: 'Savings'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index != savingsAccount - 1
                            ? Colors.grey
                            : Colors.transparent,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.savings_outlined,
                      size: 40,
                      color: AuditTheme.primaryColor,
                    ),
                    title: Text('Saving Account'),
                    subtitle: Text('NDSL RA01 234 3453 7D'),
                    trailing: Text(
                      '\$21,874',
                      style: TextStyle(
                        color: AuditTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              childCount: 2,
            ),
          ),
          Widgets().divider(),
        ],
      ),
    );
  }
}
