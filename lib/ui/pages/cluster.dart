import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/constants/app_constants.dart';
import 'package:moni/core/constants/images.dart';
import 'package:moni/core/enums/viewstate.dart';
import 'package:moni/core/utils/utilities.dart';
import 'package:moni/core/vm/cluster_vm.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:moni/ui/shared/helpers/space.dart';
import 'package:moni/ui/shared/helpers/styles.dart';
import 'package:moni/ui/shared/helpers/utils.dart';
import 'package:moni/ui/shared/widget/loading_background.dart';
import 'package:moni/ui/shared/widget/cluster/cluster_details.dart';
import 'package:moni/ui/shared/widget/cluster/cluster_members.dart';
import 'package:provider/provider.dart';

class ClusterPage extends StatefulWidget {
  const ClusterPage({Key? key}) : super(key: key);

  @override
  _ClusterPageState createState() => _ClusterPageState();
}

class _ClusterPageState extends State<ClusterPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    initialize();
  }

  initialize() async {
    await Provider.of<ClusterVM>(context, listen: false).getClusters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ClusterVM>(builder: (context, clusterVM, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: RefreshIndicator(
              onRefresh: () async {
                await clusterVM.getClusters();
              },
              child: _clusterContent(clusterVM)),
        );
      }),
    );
  }

  Widget _clusterContent(ClusterVM clusterVM) {
    Widget content = const SizedBox();
    //retrieving  data
    if (clusterVM.viewState == ViewState.busy) {
      content = const LoadingBackground();
    }
    //error occurred
    else if (clusterVM.viewState == ViewState.error) {
      content = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Styles.bold(clusterVM.statusMessage!,
            color: darkBlue, align: TextAlign.center),
        VSpace(16.h),
        InkWell(
          onTap: () async {
            await clusterVM.getClusters();
          },
          child: Container(
            width: 109.w,
            height: 32.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: brandRed, borderRadius: BorderRadius.circular(6.r)),
            child: Styles.regular("Retry", fontSize: 12.sp, color: white),
          ),
        )
      ]);
    }
    //clusters successfully retrived
    else if (clusterVM.viewState == ViewState.retrieved) {
      content = Column(
        children: [
          Container(
            width: deviceWidth(context),
            decoration: const BoxDecoration(color: kinkyDark),
            padding: EdgeInsets.only(top: 40.h),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.arrow_back, color: white),
                  ),
                  Styles.bold("My Cluster", color: white, fontSize: 17.sp),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  )
                ],
              ),
              VSpace(14.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Styles.bold(clusterVM.cluster.clusterName,
                            color: white, fontSize: 14.sp),
                        VSpace(4.h),
                        _repaymentBlock(
                            "Repayment Rate: ",
                            clusterVM.getRate(
                                clusterVM.cluster.clusterRepaymentRate),
                            secondaryYellow),
                        VSpace(4.h),
                        _repaymentBlock(
                            "Repayment Date: ",
                            "Every ${clusterVM.cluster.clusterRepaymentDay}",
                            lighterGreen),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: FadeInImage(
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                          placeholder: const AssetImage(moniLogo2),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(moniLogo, fit: BoxFit.fitWidth);
                          },
                          image: NetworkImage(url)),
                    )
                  ],
                ),
              ),
              VSpace(16.h),
              _hDivider(),
              VSpace(11.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Styles.regular("Cluster purse balance",
                            color: white, fontSize: 9.sp),
                        VSpace(4.h),
                        Styles.bold(
                            "₦" +
                                Utilities.formatAmount(
                                    amount: double.parse(clusterVM
                                        .cluster.clusterPurseBalance
                                        .toString())),
                            color: white,
                            fontSize: 14.sp),
                        VSpace(4.h),
                        Styles.regular(
                            "+₦" +
                                Utilities.formatAmount(
                                    amount: double.parse(clusterVM
                                        .cluster.clusterPurseBalance
                                        .toString())) +
                                " interest today",
                            color: lighterGreen,
                            fontSize: 9.sp),
                      ],
                    ),
                    Container(
                      width: 109.w,
                      height: 32.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: brandRed,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Styles.regular("View Purse",
                          fontSize: 12.sp, color: white),
                    )
                  ],
                ),
              ),
              VSpace(11.h),
              _hDivider(),
              VSpace(8.h),
              _totalBlock(
                  "Total interest earned",
                  "₦" +
                      Utilities.formatAmount(
                          amount: double.parse(clusterVM
                              .cluster.totalInterestEarned
                              .toString())),
                  brandYellow),
              VSpace(8.h),
              _hDivider(),
              VSpace(8.h),
              _totalBlock(
                  "Total owed by members",
                  "₦" +
                      Utilities.formatAmount(
                          amount: double.parse(
                              clusterVM.cluster.totalOwedByMembers.toString())),
                  white),
              VSpace(19.3.h),
            ]),
          ),
          Container(
            height: 50.h,
            decoration: const BoxDecoration(color: lighterYellow),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Members (${clusterVM.getMembersCount()})"),
                const Tab(text: "Cluster Details")
              ],
              indicatorWeight: 2.h,
              indicatorColor: orange,
              unselectedLabelColor: darkBlack,
              labelColor: orange,
              labelStyle: TextStyle(
                  color: orange, fontSize: 14.sp, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                  color: darkBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [ClusterMembers(), ClusterDetails()],
          ))
        ],
      );
    }
    return content;
  }

  Widget _repaymentBlock(
      String subLabel, String mainLabel, Color mainLabelColor) {
    return Container(
      height: 20.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: black, borderRadius: BorderRadius.circular(100.r)),
      child: RichText(
        text: TextSpan(
          text: subLabel,
          style: TextStyle(color: baseGrey, fontSize: 14.sp),
          children: <TextSpan>[
            TextSpan(
                text: mainLabel,
                style: TextStyle(
                    color: mainLabelColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }

  Widget _totalBlock(String label, String amount, Color amountColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Styles.regular(label, color: baseGrey, fontSize: 12.sp),
          Styles.regular(amount, color: amountColor, fontSize: 12.sp),
        ],
      ),
    );
  }

  Widget _hDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: mercuryGrey, thickness: 0.5),
    );
  }
}
