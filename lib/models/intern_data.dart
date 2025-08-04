import 'package:flutter/material.dart';

class InternData {
  final String name;
  final String referralCode;
  final double totalDonations;
  final int rank;
  final List<Reward> rewards;
  final int totalReferrals;
  final double monthlyGoal;
  final String profileImage;
  final String email;
  final DateTime joinDate;

  InternData({
    required this.name,
    required this.referralCode,
    required this.totalDonations,
    required this.rank,
    required this.rewards,
    this.totalReferrals = 0,
    this.monthlyGoal = 10000.0,
    this.profileImage = '',
    this.email = '',
    required this.joinDate,
  });
}

class Reward {
  final String title;
  final String description;
  final bool isUnlocked;
  final IconData icon;
  final Color color;
  final int requiredAmount;
  final String category;

  Reward({
    required this.title,
    required this.description,
    required this.isUnlocked,
    required this.icon,
    required this.color,
    this.requiredAmount = 0,
    this.category = 'Achievement',
  });
}

class LeaderboardEntry {
  final String name;
  final double donations;
  final int rank;
  final String avatar;
  final int referrals;
  final Color accentColor;
  final double weeklyGrowth;

  LeaderboardEntry({
    required this.name,
    required this.donations,
    required this.rank,
    this.avatar = '',
    this.referrals = 0,
    required this.accentColor,
    this.weeklyGrowth = 0.0,
  });
}

class Announcement {
  final String title;
  final String content;
  final DateTime date;
  final bool isImportant;
  final String category;
  final IconData icon;
  final Color categoryColor;

  Announcement({
    required this.title,
    required this.content,
    required this.date,
    required this.isImportant,
    this.category = 'General',
    this.icon = Icons.info,
    required this.categoryColor,
  });
}

class DonationHistory {
  final String donorName;
  final double amount;
  final DateTime date;
  final String method;
  final String status;

  DonationHistory({
    required this.donorName,
    required this.amount,
    required this.date,
    required this.method,
    this.status = 'Completed',
  });
}
