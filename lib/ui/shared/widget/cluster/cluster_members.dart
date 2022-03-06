import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/enums/loan_status.dart';
import 'package:moni/core/vm/cluster_vm.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:moni/ui/shared/helpers/space.dart';
import 'package:moni/ui/shared/helpers/styles.dart';
import 'package:moni/ui/shared/widget/cluster/loan_status_item.dart';
import 'package:provider/provider.dart';

class ClusterMembers extends StatefulWidget {
  const ClusterMembers({Key? key}) : super(key: key);

  @override
  State<ClusterMembers> createState() => _ClusterMembersState();
}

class _ClusterMembersState extends State<ClusterMembers> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ClusterVM>(builder: (context, clusterVM, child) {
        return Container(
          padding: EdgeInsets.only(top: 23.w, right: 17.w, left: 17.w),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Styles.regular("Overdue Loans", fontSize: 13.6.sp),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 9.3.w,
                        height: 1.3.w,
                        color: black.withOpacity(0.54),
                      )
                    ],
                  ),
                  VSpace(16.h),
                  LoanStatusItem(
                    loanStatus: LoanStatus.overdue,
                    agents: clusterVM.cluster.overdueAgents,
                  ),
                ],
              ),
              VSpace(24.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Styles.regular("Due Today", fontSize: 13.6.sp),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 9.3.w,
                        height: 1.3.w,
                        color: black.withOpacity(0.54),
                      )
                    ],
                  ),
                  VSpace(16.h),
                  LoanStatusItem(
                    loanStatus: LoanStatus.dueToday,
                    agents: clusterVM.cluster.dueAgents,
                  ),
                ],
              ),
              VSpace(24.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Styles.regular("Active Loans", fontSize: 13.6.sp),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 9.3.w,
                        height: 1.3.w,
                        color: black.withOpacity(0.54),
                      )
                    ],
                  ),
                  VSpace(16.h),
                  LoanStatusItem(
                    loanStatus: LoanStatus.active,
                    agents: clusterVM.cluster.activeAgents,
                  ),
                ],
              ),
              VSpace(24.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Styles.regular("Inactive Loans", fontSize: 13.6.sp),
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        width: 9.3.w,
                        height: 1.3.w,
                        color: black.withOpacity(0.54),
                      )
                    ],
                  ),
                  VSpace(16.h),
                  LoanStatusItem(
                    loanStatus: LoanStatus.inactive,
                    agents: clusterVM.cluster.inactiveAgents,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
