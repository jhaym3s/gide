// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:gide/core/configs/configs.dart';
import 'package:gide/features/dashboard/wallet/widgets/wallet_balance_card.dart';
import '../../../../core/components/custom_tab_bar.dart';
import '../widgets/transaction_list_tile.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "wallet_screen";
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool viewAmount = true;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopWalletBar(
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    SpaceY(24.dy),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            viewAmount = !viewAmount;
                          });
                        },
                        child: WalletBalanceCard(viewAmount: viewAmount)),
                    SpaceY(24.dy),
                    Padding(
                      padding: EdgeInsets.only(left: 20.dx),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Transactions",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColorsLight)),
                      ),
                    ),
                    SpaceY(16.dy),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return const TransactionListTile();
                      }),
                    )
                  ],
                ),
                //!
                Column(
                  children: [
                    SpaceY(24.dy),
                    const RewardBalanceCard(),
                    SpaceY(24.dy),
                    Padding(
                      padding: EdgeInsets.only(left: 20.dx),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Transactions",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColorsLight)),
                      ),
                    ),
                    SpaceY(16.dy),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return const TransactionListTile();
                      }),
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class TopWalletBar extends StatelessWidget {
  const TopWalletBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: kWhite,
        height: 143.dy,
        width: kScreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceY(32.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: Text("Wallet",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kTextColorsLight)),
            ),
            SpaceY(16.dy),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dx),
              child: CustomTwoTabBar(
                tabController: _tabController,
                label1: "Cash Balance",
                label2: "Reward Balance",
              ),
            ),
            SpaceY(29.dy),
            Divider(
              color: kGrey,
              height: 1.dy,
            ),
          ],
        ),
      ),
    );
  }
}
