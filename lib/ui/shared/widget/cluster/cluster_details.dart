import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moni/core/constants/text.dart';
import 'package:moni/ui/shared/helpers/colors.dart';
import 'package:moni/ui/shared/helpers/space.dart';
import 'package:moni/ui/shared/helpers/styles.dart';

class ClusterDetails extends StatefulWidget {
  const ClusterDetails({Key? key}) : super(key: key);

  @override
  State<ClusterDetails> createState() => _ClusterDetailsState();
}

class _ClusterDetailsState extends State<ClusterDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: white,
      padding: EdgeInsets.only(top: 23.w, right: 17.w, left: 17.w),
      child: Column(children: [
        _clausterPurseSetting(),
        _groupInviteLinkCode(),
        _loanSettings(),
        _pendingRequest(),
        _groupSetting(),
        _benefitEarned()
      ]),
    ));
  }

  Widget _clausterPurseSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(FontAwesomeIcons.ggCircle, "Clauster purse setting"),
        VSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.regular("Frequency of contribution",
                    fontSize: 14.sp, color: darkBlack),
                VSpace(4.h),
                Styles.regular("Monthly upfront",
                    fontSize: 16.sp, color: kinkyDark)
              ],
            ),
            HSpace(8.w),
            Styles.regular("Change", fontSize: 13.16.sp, color: orange),
          ],
        ),
        VSpace(8.h),
        Styles.bold("₦550,000,000", fontSize: 14.sp, color: kinkyDark),
        VSpace(8.h),
        Styles.regular("Your contribution is 8% of the eligible amount",
            color: baliGrey, fontSize: 14.sp),
        VSpace(16.h),
        const Divider(
          thickness: 1.1,
          color: ronyGrey,
        ),
        VSpace(16.h)
      ],
    );
  }

  Widget _groupInviteLinkCode() {
    return Column(
      children: [
        _sectionTitle(FontAwesomeIcons.link, "Group invite Link/Code",
            iconSize: 20),
        VSpace(8.h),
        Styles.regular("Use the link or code below to invite new member",
            fontSize: 14.sp, color: kinkyDark),
        VSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.regular("Member invite group",
                    fontSize: 14.sp, color: darkBlack),
                VSpace(4.h),
                Styles.regular("30DF38TG000", fontSize: 16.sp, color: kinkyDark)
              ],
            ),
            HSpace(8.w),
            Styles.regular("Get new code", fontSize: 13.16.sp, color: orange),
          ],
        ),
        VSpace(16.h),
        const Divider(
          thickness: 1.1,
          color: ronyGrey,
        ),
        VSpace(16.h)
      ],
    );
  }

  Widget _loanSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(FontAwesomeIcons.cog, "Loan Setting", iconSize: 20),
        VSpace(16.h),
        Styles.regular("Total loan collected by cluster",
            fontSize: 12.sp, color: rushDark),
        VSpace(8.h),
        Styles.bold("₦550,000,000", fontSize: 14.sp, color: kinkyDark),
        VSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.regular("Repayment Day",
                    fontSize: 12.sp, color: rushDark),
                VSpace(8.h),
                Styles.semiBold("Every Monday",
                    fontSize: 14.sp, color: kinkyDark)
              ],
            ),
            HSpace(8.w),
            Styles.regular("Change", fontSize: 14.sp, color: orange),
          ],
        ),
        VSpace(16.h),
        const Divider(
          thickness: 1.1,
          color: ronyGrey,
        ),
        VSpace(16.h)
      ],
    );
  }

  Widget _pendingRequest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(FontAwesomeIcons.list, "Pending Join Request",
            iconSize: 20),
        VSpace(16.h),
        Styles.regular("No pending cluster join request",
            fontSize: 14.sp, color: darkGrey),
        VSpace(16.h),
        const Divider(
          thickness: 1.1,
          color: ronyGrey,
        ),
        VSpace(16.h)
      ],
    );
  }

  Widget _groupSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(FontAwesomeIcons.userCog, "Group Settings",
            iconSize: 20, hSpace: 12.w),
        VSpace(16.h),
        Styles.regular("Group rules", fontSize: 14.sp, color: kinkyDark),
        VSpace(16.h),
        _rulesItemBlock("   1. ", groupRule),
        _rulesItemBlock("   2. ", groupRule),
        //Styles.regular(groupRules2, fontSize: 14.sp, color: darkGrey),
        VSpace(16.h),
        Styles.regular("Group Whatsapp", fontSize: 14.sp, color: kinkyDark),
        VSpace(8.h),
        Styles.regular(groupWhatsappLink, fontSize: 13.16.sp, color: darkGreen),
        VSpace(16.h),
        Row(
          children: [
            const Icon(Icons.edit, color: orange, size: 20),
            HSpace(8.w),
            Styles.regular("Edit Settings", fontSize: 12.sp, color: orange),
          ],
        ),
        VSpace(16.h),
        const Divider(
          thickness: 1.1,
          color: ronyGrey,
        ),
        VSpace(16.h)
      ],
    );
  }

  Widget _benefitEarned() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(FontAwesomeIcons.moneyBillWave, "Benefit earned",
            iconSize: 20, hSpace: 12.w),
        VSpace(16.h),
        Styles.regular("Total CH benefits earned",
            fontSize: 14.sp, color: rushDark),
        VSpace(8.h),
        Styles.bold("₦550,000,000", fontSize: 14.sp, color: kinkyDark),
        VSpace(16.h),
        Styles.regular("Available Benefits", fontSize: 14.sp, color: kinkyDark),
        VSpace(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Styles.bold("₦550,000,000", fontSize: 14.sp, color: kinkyDark),
            Styles.regular("+₦550,000,000 today",
                fontSize: 13.sp, color: lighterGreen, fontFamily: "Inter"),
          ],
        ),
        VSpace(9.h),
        Row(
          children: [
            const Icon(Icons.visibility, color: orange, size: 20),
            HSpace(8.w),
            Styles.regular("View earning history",
                fontSize: 12.sp, color: orange),
          ],
        ),
        VSpace(16.h),
      ],
    );
  }

  Widget _rulesItemBlock(String ruleNo, String rule) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Styles.regular(ruleNo,
                  overflow: TextOverflow.visible,
                  fontSize: 14.sp,
                  color: darkGrey)),
          Flexible(
              flex: 9,
              child: Styles.regular(rule,
                  overflow: TextOverflow.visible,
                  fontSize: 14.sp,
                  color: darkGrey)),
        ],
      ),
    );
  }

  Widget _sectionTitle(IconData data, String title,
      {double? iconSize, double? hSpace}) {
    return Row(
      children: [
        Icon(data, color: baliGrey, size: iconSize ?? 24),
        HSpace(hSpace ?? 8.w),
        Styles.bold(
          title,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
