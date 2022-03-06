import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moni/core/constants/images.dart';
import 'package:moni/core/enums/loan_status.dart';
import 'package:moni/core/models/cluster.dart';
import 'package:moni/core/utils/utilities.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:moni/ui/shared/helpers/space.dart';
import 'package:moni/ui/shared/helpers/styles.dart';

class LoanStatusItem extends StatelessWidget {
  final LoanStatus loanStatus;
  final List<ActiveAgent> agents;
  const LoanStatusItem(
      {Key? key, required this.loanStatus, required this.agents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loanContent();
  }

  Widget loanContent() {
    List<Widget> items = [];

    if (agents.isNotEmpty) {
      for (int i = 0; i < agents.length; i++) {
        ActiveAgent agent = agents[i];
        Widget item = Column(
          children: [
            const Divider(color: ebonyGrey, thickness: 1.01),
            VSpace(16.h),
            Row(
              children: [
                agent.agent.mediaUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: FadeInImage(
                          width: 48.w,
                          height: 48.w,
                          fit: BoxFit.cover,
                          placeholder: const AssetImage(moniLogo),
                          image: NetworkImage(agent.agent.mediaUrl!),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(moniLogo,
                                width: 48.w,
                                height: 48.w,
                                fit: BoxFit.fitWidth);
                          },
                        ))
                    : Container(
                        width: 48.w,
                        height: 48.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Utilities.mainLoanStatusColor(loanStatus),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Styles.bold(
                            Utilities.getInitials(
                                agent.agent.firstName, agent.agent.lastName),
                            color: white),
                      ),
                HSpace(16.w),
                loanStatus == LoanStatus.inactive
                    ? Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.regular(
                                Utilities.capitalizeFirstWord(
                                    agent.agent.firstName +
                                        " " +
                                        agent.agent.lastName),
                                overflow: TextOverflow.visible,
                                color: darkBlue,
                                fontSize: 13.6.sp),
                            VSpace(4.h),
                            Styles.regular("No active loan",
                                fontSize: 12.sp,
                                color:
                                    Utilities.mainLoanStatusColor(loanStatus)),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Flexible(
                                child: Styles.regular(
                                    Utilities.capitalizeFirstWord(
                                      agent.agent.firstName +
                                          " " +
                                          agent.agent.lastName,
                                    ),
                                    overflow: TextOverflow.visible,
                                    color: darkBlue,
                                    fontSize: 13.6.sp),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8.w),
                                width: 4.w,
                                height: 4.w,
                                decoration: const BoxDecoration(
                                    color: mildGrey, shape: BoxShape.circle),
                              ),
                              Flexible(
                                child: Styles.regular(
                                    Utilities.loanDaysLeftMessage(
                                        agent.acceptedAt, loanStatus),
                                    overflow: TextOverflow.ellipsis,
                                    color: Utilities.subLoanStatusColor(
                                        loanStatus),
                                    fontSize: 12.sp),
                              ),
                            ]),
                            VSpace(4.h),
                            // "₦" +

                            Styles.bold(
                                "₦${Utilities.formatAmount(amount: double.parse(agent.agent.recentLoan!.agentLoan.loanAmountDue.toString()))} ${Utilities.loanStatusMessage(loanStatus)}",
                                fontSize: 12.sp,
                                color:
                                    Utilities.mainLoanStatusColor(loanStatus)),
                          ],
                        ),
                      ),
              ],
            ),
            VSpace(16.h),
            //const Divider(color: ebonyGrey, thickness: 1.01),
          ],
        );

        items.add(item);
      }
      return Column(
        children: items,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: ebonyGrey, thickness: 1.01),
          VSpace(16.h),
          Row(
            children: [
              const Icon(
                Icons.info,
                color: orange,
                size: 16,
              ),
              HSpace(4.w),
              Styles.regular(Utilities.loanEmptyStateMessage(loanStatus),
                  fontSize: 12.sp, color: darkGrey),
            ],
          ),
          VSpace(16.h),
          const Divider(color: ebonyGrey, thickness: 1.01),
        ],
      );
    }
  }
}
