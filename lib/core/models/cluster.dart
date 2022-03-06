import 'dart:convert';

Cluster clusterFromJson(String str) => Cluster.fromJson(json.decode(str));

class Cluster {
  Cluster({
    required this.clusterPurseBalance,
    required this.totalInterestEarned,
    required this.totalOwedByMembers,
    required this.overdueAgents,
    required this.clusterName,
    required this.clusterRepaymentRate,
    required this.clusterRepaymentDay,
    required this.dueAgents,
    required this.activeAgents,
    required this.inactiveAgents,
  });

  int clusterPurseBalance;
  int totalInterestEarned;
  int totalOwedByMembers;
  List<ActiveAgent> overdueAgents;
  String clusterName;
  double clusterRepaymentRate;
  String clusterRepaymentDay;
  List<ActiveAgent> dueAgents;
  List<ActiveAgent> activeAgents;
  List<ActiveAgent> inactiveAgents;

  factory Cluster.fromJson(Map<String, dynamic> json) => Cluster(
        clusterPurseBalance: json["cluster_purse_balance"],
        totalInterestEarned: json["total_interest_earned"],
        totalOwedByMembers: json["total_owed_by_members"],
        overdueAgents: List<ActiveAgent>.from(
            json["overdue_agents"].map((x) => ActiveAgent.fromJson(x))),
        clusterName: json["cluster_name"],
        clusterRepaymentRate: json["cluster_repayment_rate"].toDouble(),
        clusterRepaymentDay: json["cluster_repayment_day"],
        dueAgents: List<ActiveAgent>.from(
            json["due_agents"].map((x) => ActiveAgent.fromJson(x))),
        activeAgents: List<ActiveAgent>.from(
            json["active_agents"].map((x) => ActiveAgent.fromJson(x))),
        inactiveAgents: List<ActiveAgent>.from(
            json["inactive_agents"].map((x) => ActiveAgent.fromJson(x))),
      );
}

class ActiveAgent {
  ActiveAgent({
    required this.id,
    required this.userId,
    required this.agentId,
    required this.clusterId,
    required this.statusId,
    required this.acceptedAt,
    required this.createdAt,
    required this.agent,
  });

  String id;
  String userId;
  String agentId;
  String clusterId;
  int statusId;
  DateTime acceptedAt;
  DateTime createdAt;
  Agent agent;

  factory ActiveAgent.fromJson(Map<String, dynamic> json) => ActiveAgent(
        id: json["id"],
        userId: json["user_id"],
        agentId: json["agent_id"],
        clusterId: json["cluster_id"],
        statusId: json["status_id"],
        acceptedAt: DateTime.parse(json["accepted_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        agent: Agent.fromJson(json["agent"]),
      );
}

class Agent {
  Agent({
    required this.id,
    required this.userId,
    this.moniId,
    this.eligibleLoanId,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.nickname,
    this.birthDate,
    this.gender,
    this.businessName,
    this.maritalStatus,
    this.education,
    this.houseAddress,
    this.shopAddress,
    this.lga,
    this.city,
    this.state,
    this.country,
    this.phoneNumber,
    this.emailAddress,
    this.bvn,
    this.hasCreditHistory,
    this.verified,
    this.referralLink,
    this.mediaUrl,
    this.channel,
    this.agentRepaymentRate,
    this.bvnVerifiedAfter,
    this.loanEnabled,
    this.statusId,
    this.eligibleLoanModifiedAt,
    this.createdAt,
    this.modifiedAt,
    this.capAgentLoan,
    this.loanCount,
    this.recentLoan,
    this.suspended,
  });

  String id;
  String userId;
  String? moniId;
  String? eligibleLoanId;
  String firstName;
  String? middleName;
  String lastName;
  String? nickname;
  DateTime? birthDate;
  String? gender;
  String? businessName;
  String? maritalStatus;
  String? education;
  String? houseAddress;
  String? shopAddress;
  String? lga;
  String? city;
  String? state;
  String? country;
  String? phoneNumber;
  String? emailAddress;
  String? bvn;
  int? hasCreditHistory;
  int? verified;
  String? referralLink;
  String? mediaUrl;
  String? channel;
  int? agentRepaymentRate;
  int? bvnVerifiedAfter;
  int? loanEnabled;
  int? statusId;
  DateTime? eligibleLoanModifiedAt;
  DateTime? createdAt;
  DateTime? modifiedAt;
  int? capAgentLoan;
  int? loanCount;
  RecentLoan? recentLoan;
  bool? suspended;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"],
        userId: json["user_id"],
        moniId: json["moni_id"],
        eligibleLoanId:
            json["eligible_loan_id"] == null ? null : json["eligible_loan_id"]!,
        firstName: json["first_name"] == null ? null : json["first_name"]!,
        middleName: json["middle_name"] == null ? null : json["middle_name"]!,
        lastName: json["last_name"] == null ? null : json["last_name"]!,
        nickname: json["nickname"] == null ? null : json["nickname"]!,
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]!),
        gender: json["gender"] == null ? null : json["gender"]!,
        businessName:
            json["business_name"] == null ? null : json["business_name"]!,
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"]!,
        education: json["education"] == null ? null : json["education"]!,
        houseAddress:
            json["house_address"] == null ? null : json["house_address"]!,
        shopAddress:
            json["shop_address"] == null ? null : json["shop_address"]!,
        lga: json["lga"] == null ? null : json["lga"]!,
        city: json["city"] == null ? null : json["city"]!,
        state: json["state"] == null ? null : json["state"]!,
        country: json["country"],
        phoneNumber:
            json["phone_number"] == null ? null : json["phone_number"]!,
        emailAddress:
            json["email_address"] == null ? null : json["email_address"]!,
        bvn: json["bvn"] == null ? null : json["bvn"]!,
        hasCreditHistory: json["has_credit_history"] == null
            ? null
            : json["has_credit_history"]!,
        verified: json["verified"] == null ? null : json["verified"]!,
        referralLink:
            json["referral_link"] == null ? null : json["referral_link"]!,
        mediaUrl: json["media_url"] == null ? null : json["media_url"]!,
        channel: json["channel"] == null ? null : json["channel"]!,
        agentRepaymentRate: json["agent_repayment_rate"] == null
            ? null
            : json["agent_repayment_rate"]!,
        bvnVerifiedAfter: json["bvn_verified_after"] == null
            ? null
            : json["bvn_verified_after"]!,
        loanEnabled:
            json["loan_enabled"] == null ? null : json["loan_enabled"]!,
        statusId: json["status_id"] == null ? null : json["status_id"]!,
        eligibleLoanModifiedAt: json["eligible_loan_modified_at"] == null
            ? null
            : DateTime.parse(json["eligible_loan_modified_at"]!),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]!),
        modifiedAt: json["modified_at"] == null
            ? null
            : DateTime.parse(json["modified_at"]!),
        capAgentLoan:
            json["cap_agent_loan"] == null ? null : json["cap_agent_loan"]!,
        loanCount: json["loan_count"] == null ? null : json["loan_count"]!,
        recentLoan: json["recent_loan"] == null
            ? null
            : RecentLoan.fromJson(json["recent_loan"]!),
        suspended: json["suspended"] == null ? null : json["suspended"]!,
      );
}

class RecentLoan {
  RecentLoan({
    required this.id,
    required this.agentId,
    required this.clusterId,
    required this.agentLoanId,
    required this.loanAmount,
    required this.createdAt,
    required this.agentLoan,
  });

  String id;
  String agentId;
  String clusterId;
  String agentLoanId;
  int loanAmount;
  DateTime createdAt;
  AgentLoan agentLoan;

  factory RecentLoan.fromJson(Map<String, dynamic> json) => RecentLoan(
        id: json["id"],
        agentId: json["agent_id"],
        clusterId: json["cluster_id"],
        agentLoanId: json["agent_loan_id"],
        loanAmount: json["loan_amount"],
        createdAt: DateTime.parse(json["created_at"]),
        agentLoan: AgentLoan.fromJson(json["agent_loan"]),
      );
}

class AgentLoan {
  AgentLoan({
    required this.id,
    required this.agentId,
    this.agentCreditScoreId,
    this.loanId,
    this.agentCardId,
    this.interestType,
    this.interestValue,
    this.loanDurationType,
    this.loanDuration,
    this.loanDueDate,
    this.daysPastDue,
    this.loanAmount,
    this.loanAmountDue,
    this.loanInterestDue,
    this.loanPaymentDate,
    this.loanPaymentRate,
    this.loanAmountPaid,
    this.penaltyOutstanding,
    this.penaltyPaid,
    this.principalPaid,
    this.principalOutstanding,
    this.interestPaid,
    this.interestOutstanding,
    this.penaltyAmount,
    this.loanStatus,
    this.isMax,
    this.statusId,
    this.acceptTerms,
    this.createdAt,
    this.modifiedAt,
    this.status,
  });

  String id;
  String agentId;
  String? agentCreditScoreId;
  String? loanId;
  String? agentCardId;
  String? interestType;
  double? interestValue;
  String? loanDurationType;
  int? loanDuration;
  DateTime? loanDueDate;
  int? daysPastDue;
  int? loanAmount;
  int? loanAmountDue;
  int? loanInterestDue;
  DateTime? loanPaymentDate;
  int? loanPaymentRate;
  int? loanAmountPaid;
  int? penaltyOutstanding;
  int? penaltyPaid;
  int? principalPaid;
  int? principalOutstanding;
  int? interestPaid;
  int? interestOutstanding;
  int? penaltyAmount;
  Status? loanStatus;
  int? isMax;
  int? statusId;
  int? acceptTerms;
  DateTime? createdAt;
  DateTime? modifiedAt;
  Status? status;

  factory AgentLoan.fromJson(Map<String, dynamic> json) => AgentLoan(
        id: json["id"],
        agentId: json["agent_id"],
        agentCreditScoreId: json["agent_credit_score_id"] == null
            ? null
            : json["agent_credit_score_id"]!,
        loanId: json["loan_id"] == null ? null : json["loan_id"]!,
        agentCardId:
            json["agent_card_id"] == null ? null : json["agent_card_id"]!,
        interestType:
            json["interest_type"] == null ? null : json["interest_type"]!,
        interestValue: json["interest_value"] == null
            ? null
            : json["interest_value"]!.toDouble(),
        loanDurationType: json["loan_duration_type"] == null
            ? null
            : json["loan_duration_type"]!,
        loanDuration:
            json["loan_duration"] == null ? null : json["loan_duration"]!,
        loanDueDate: json["loan_due_date"] == null
            ? null
            : DateTime.parse(json["loan_due_date"]!),
        daysPastDue:
            json["days_past_due"] == null ? null : json["days_past_due"]!,
        loanAmount: json["loan_amount"] == null ? null : json["loan_amount"]!,
        loanAmountDue:
            json["loan_amount_due"] == null ? null : json["loan_amount_due"]!,
        loanInterestDue: json["loan_interest_due"] == null
            ? null
            : json["loan_interest_due"]!,
        loanPaymentDate: json["loan_payment_date"] == null
            ? null
            : DateTime.parse(json["loan_payment_date"]!),
        loanPaymentRate: json["loan_payment_rate"] == null
            ? null
            : json["loan_payment_rate"]!,
        loanAmountPaid:
            json["loan_amount_paid"] == null ? null : json["loan_amount_paid"]!,
        penaltyOutstanding: json["penalty_outstanding"] == null
            ? null
            : json["penalty_outstanding"]!,
        penaltyPaid:
            json["penalty_paid"] == null ? null : json["penalty_paid"]!,
        principalPaid:
            json["principal_paid"] == null ? null : json["principal_paid"]!,
        principalOutstanding: json["principal_outstanding"] == null
            ? null
            : json["principal_outstanding"]!,
        interestPaid:
            json["interest_paid"] == null ? null : json["interest_paid"]!,
        interestOutstanding: json["interest_outstanding"] == null
            ? null
            : json["interest_outstanding"]!,
        penaltyAmount:
            json["penalty_amount"] == null ? null : json["penalty_amount"]!,
        loanStatus: json["loan_status"] == null
            ? null
            : Status.fromJson(json["loan_status"]!),
        isMax: json["is_max"] == null ? null : json["is_max"]!,
        statusId: json["status_id"] == null ? null : json["status_id"]!,
        acceptTerms:
            json["accept_terms"] == null ? null : json["accept_terms"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]!),
        modifiedAt: json["modified_at"] == null
            ? null
            : DateTime.parse(json["modified_at"]!),
        status:
            json["status"] == null ? null : Status.fromJson(json["status"]!),
      );
}

class Status {
  Status({
    required this.id,
    this.name,
    this.label,
    this.description,
    this.createdAt,
    this.modifiedAt,
  });

  int id;
  String? name;
  String? label;
  String? description;
  DateTime? createdAt;
  DateTime? modifiedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"] == null ? null : json["id"]!,
        name: json["name"] == null ? null : json["name"]!,
        label: json["label"] == null ? null : json["label"]!,
        description: json["description"] == null ? null : json["description"]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]!),
        modifiedAt: json["modified_at"] == null
            ? null
            : DateTime.parse(json["modified_at"]!),
      );
}
