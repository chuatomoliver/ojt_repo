import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../constant/theme.dart';

class Widgets {
  Widget sizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget sizedBoxHeight(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget headerTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }

  Widget headerText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 35,
      ),
    );
  }

  Widget divider() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            width: double.maxFinite,
            height: 12,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }

  Widget listTile() {
    return const ListTile(
      leading: Icon(
        Icons.account_balance_wallet_outlined,
        size: 40,
        color: AuditTheme.primaryColor,
      ),
      title: Text('Bank Account'),
      subtitle: Text('NDSL RA01 203 4455'),
      trailing: Text(
        '\$30,234',
        style: TextStyle(
          color: AuditTheme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget transactionTitle({required String text}) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget gradientAppBar({required Widget title}) {
    return SliverAppBar(
      pinned: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AuditTheme.shadow,
              blurRadius: 20,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              AuditTheme.primaryColor,
              AuditTheme.secondaryColor,
            ],
          ),
        ),
      ),
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          children: const [
            Expanded(
              child: ImageIcon(
                AssetImage('assets/logo/white_logo.png'),
              ),
            ),
            Text(
              'Audit',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      title: title,
      centerTitle: true,
      actions: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ),
      ],
    );
  }
}
