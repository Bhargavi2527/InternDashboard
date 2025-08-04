import 'package:flutter/material.dart';
import '../models/intern_data.dart';

class MockData {
  static InternData getCurrentIntern() {
    return InternData(
      name: "Alex Johnson",
      referralCode: "alexjohnson2025",
      totalDonations: 5000.0,
      rank: 3,
      totalReferrals: 12,
      monthlyGoal: 10000.0,
      email: "alex.johnson@fundraising.com",
      joinDate: DateTime.now().subtract(const Duration(days: 45)),
      rewards: [
        Reward(
          title: "First Steps",
          description: "Received your first donation of ₹100+",
          isUnlocked: true,
          icon: Icons.rocket_launch,
          color: const Color(0xFF00D4AA),
          requiredAmount: 100,
          category: "Milestone",
        ),
        Reward(
          title: "Rising Star",
          description: "Successfully raised ₹1,000 in donations",
          isUnlocked: true,
          icon: Icons.trending_up,
          color: const Color(0xFF6C5CE7),
          requiredAmount: 1000,
          category: "Milestone",
        ),
        Reward(
          title: "Champion",
          description: "Achieved ₹5,000 fundraising milestone",
          isUnlocked: true,
          icon: Icons.emoji_events,
          color: const Color(0xFFFD79A8),
          requiredAmount: 5000,
          category: "Milestone",
        ),
        Reward(
          title: "Top Performer",
          description: "Reached top 3 position in monthly leaderboard",
          isUnlocked: true,
          icon: Icons.workspace_premium,
          color: const Color(0xFFFFB347),
          category: "Achievement",
        ),
        Reward(
          title: "Network Builder",
          description: "Referred 10+ new donors to the platform",
          isUnlocked: true,
          icon: Icons.people,
          color: const Color(0xFF74B9FF),
          category: "Social",
        ),
        Reward(
          title: "Elite Fundraiser",
          description: "Raise ₹10,000 in total donations",
          isUnlocked: false,
          icon: Icons.diamond,
          color: const Color(0xFF0984E3),
          requiredAmount: 10000,
          category: "Milestone",
        ),
        Reward(
          title: "Legend",
          description: "Reach #1 position on the leaderboard",
          isUnlocked: false,
          icon: Icons.military_tech,
          color: const Color(0xFFE17055),
          category: "Achievement",
        ),
        Reward(
          title: "Consistency Master",
          description: "Maintain top 5 position for 3 months",
          isUnlocked: false,
          icon: Icons.timeline,
          color: const Color(0xFF00B894),
          category: "Achievement",
        ),
      ],
    );
  }

  static List<LeaderboardEntry> getLeaderboard() {
    return [
      LeaderboardEntry(
        name: "Sarah Chen", 
        donations: 8500.0, 
        rank: 1,
        referrals: 25,
        avatar: 'SC',
        accentColor: const Color(0xFFFFD700),
        weeklyGrowth: 12.5,
      ),
      LeaderboardEntry(
        name: "Michael Rodriguez", 
        donations: 7200.0, 
        rank: 2,
        referrals: 18,
        avatar: 'MR',
        accentColor: const Color(0xFFC0C0C0),
        weeklyGrowth: 8.3,
      ),
      LeaderboardEntry(
        name: "Alex Johnson", 
        donations: 5000.0, 
        rank: 3,
        referrals: 12,
        avatar: 'AJ',
        accentColor: const Color(0xFFCD7F32),
        weeklyGrowth: 15.2,
      ),
      LeaderboardEntry(
        name: "Emily Davis", 
        donations: 4800.0, 
        rank: 4,
        referrals: 15,
        avatar: 'ED',
        accentColor: const Color(0xFF6C5CE7),
        weeklyGrowth: 6.7,
      ),
      LeaderboardEntry(
        name: "David Kim", 
        donations: 3900.0, 
        rank: 5,
        referrals: 9,
        avatar: 'DK',
        accentColor: const Color(0xFF00D4AA),
        weeklyGrowth: 4.1,
      ),
      LeaderboardEntry(
        name: "Lisa Wang", 
        donations: 3200.0, 
        rank: 6,
        referrals: 7,
        avatar: 'LW',
        accentColor: const Color(0xFFFD79A8),
        weeklyGrowth: 9.8,
      ),
      LeaderboardEntry(
        name: "James Wilson", 
        donations: 2800.0, 
        rank: 7,
        referrals: 11,
        avatar: 'JW',
        accentColor: const Color(0xFF74B9FF),
        weeklyGrowth: 3.2,
      ),
    ];
  }

  static List<Announcement> getAnnouncements() {
    return [
      Announcement(
        title: "🎉 New Milestone Rewards Available!",
        content: "We've added exciting new rewards for reaching ₹10,000, ₹25,000, and ₹50,000 milestones. Each milestone comes with exclusive badges, bonus incentives, and special recognition. Keep fundraising to unlock these amazing rewards and showcase your achievements to the community!",
        date: DateTime.now().subtract(const Duration(hours: 2)),
        isImportant: true,
        category: "Rewards",
        icon: Icons.card_giftcard,
        categoryColor: const Color(0xFFFD79A8),
      ),
      Announcement(
        title: "📊 Weekly Leaderboard Update",
        content: "Congratulations to Sarah Chen for maintaining the #1 position this week with an impressive ₹8,500 raised! The competition is heating up as we approach month-end. Current top 3 are separated by less than ₹2,000. Great work everyone!",
        date: DateTime.now().subtract(const Duration(days: 1)),
        isImportant: false,
        category: "Leaderboard",
        icon: Icons.leaderboard,
        categoryColor: const Color(0xFF6C5CE7),
      ),
      Announcement(
        title: "💡 Advanced Fundraising Workshop",
        content: "Join us this Friday at 3 PM for an exclusive workshop on 'Advanced Fundraising Strategies & Digital Outreach'. Learn from our top performers about donor engagement, social media outreach, conversion techniques, and building lasting relationships. Register through the portal by Thursday evening.",
        date: DateTime.now().subtract(const Duration(days: 2)),
        isImportant: false,
        category: "Training",
        icon: Icons.school,
        categoryColor: const Color(0xFF00D4AA),
      ),
      Announcement(
        title: "🏆 Monthly Challenge: 50 New Contacts",
        content: "This month's special challenge: Reach out to 50 new potential donors and document your interactions in the CRM system. Winner gets a ₹2,000 bonus plus a special 'Networking Champion' badge. Challenge ends on the 30th. Current leader: Michael Rodriguez with 38 contacts!",
        date: DateTime.now().subtract(const Duration(days: 3)),
        isImportant: true,
        category: "Challenge",
        icon: Icons.emoji_events,
        categoryColor: const Color(0xFFFFB347),
      ),
      Announcement(
        title: "📱 Mobile App 2.1.0 Released",
        content: "We've rolled out major improvements including 40% faster loading times, improved navigation, better offline support, enhanced security features, and new dark mode. The update also includes push notifications for real-time donation alerts. Please update to version 2.1.0 for the best experience.",
        date: DateTime.now().subtract(const Duration(days: 5)),
        isImportant: false,
        category: "Technical",
        icon: Icons.system_update,
        categoryColor: const Color(0xFF74B9FF),
      ),
      Announcement(
        title: "🎯 Q1 Goals and New Initiatives",
        content: "As we enter the new quarter, our collective goal is to raise ₹500,000 across all interns. Individual targets have been updated in your dashboard. We're also launching a new mentorship program pairing top performers with newcomers. Remember, consistency beats intensity!",
        date: DateTime.now().subtract(const Duration(days: 7)),
        isImportant: true,
        category: "Goals",
        icon: Icons.track_changes,
        categoryColor: const Color(0xFFE17055),
      ),
    ];
  }

  static List<DonationHistory> getDonationHistory() {
    return [
      DonationHistory(
        donorName: "Rajesh Kumar",
        amount: 500.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        method: "UPI",
        status: "Completed",
      ),
      DonationHistory(
        donorName: "Priya Sharma",
        amount: 1000.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        method: "Credit Card",
        status: "Completed",
      ),
      DonationHistory(
        donorName: "Amit Patel",
        amount: 750.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        method: "Bank Transfer",
        status: "Processing",
      ),
      DonationHistory(
        donorName: "Sneha Gupta",
        amount: 300.0,
        date: DateTime.now().subtract(const Duration(days: 7)),
        method: "UPI",
        status: "Completed",
      ),
      DonationHistory(
        donorName: "Vikram Singh",
        amount: 2000.0,
        date: DateTime.now().subtract(const Duration(days: 10)),
        method: "Cheque",
        status: "Completed",
      ),
    ];
  }

  static double getProgressPercentage(double current, double target) {
    return (current / target * 100).clamp(0.0, 100.0);
  }

  static String getMotivationalMessage(double progress) {
    if (progress >= 100) return "🎉 Goal Achieved! You're amazing!";
    if (progress >= 80) return "🔥 So close! Push to the finish line!";
    if (progress >= 60) return "💪 Excellent progress! Keep the momentum!";
    if (progress >= 40) return "📈 Great work! You're on the right track!";
    if (progress >= 20) return "🌟 Good start! Stay consistent and focused!";
    return "🚀 Let's begin this journey! You've got this!";
  }
}
