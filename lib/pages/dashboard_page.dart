import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/mock_data.dart';
import '../models/intern_data.dart';
import '../widgets/stat_card.dart';
import '../widgets/reward_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/glass_container.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _progressController;
  late List<Animation<double>> _cardAnimations;
  late Animation<double> _progressAnimation;
  late InternData internData;

  @override
  void initState() {
    super.initState();
    internData = MockData.getCurrentIntern();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _cardAnimations = List.generate(
      8,
      (index) => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          index * 0.1,
          0.6 + (index * 0.05),
          curve: Curves.easeOutCubic,
        ),
      )),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: internData.totalDonations / internData.monthlyGoal,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeInOutCubic,
    ));

    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 600), () {
      _progressController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressPercentage = MockData.getProgressPercentage(
      internData.totalDonations,
      internData.monthlyGoal,
    );
    final motivationalMessage = MockData.getMotivationalMessage(progressPercentage);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          // Custom App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF6C5CE7),
                      Color(0xFFA29BFE),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Good Morning! 👋',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              internData.name.split(' ')[0],
                              style: GoogleFonts.inter(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE17055),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.refresh_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Card
                  AnimatedBuilder(
                    animation: _cardAnimations[0],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - _cardAnimations[0].value)),
                        child: Opacity(
                          opacity: _cardAnimations[0].value,
                          child: GlassContainer(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Referral Code',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: const Color(0xFF718096),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                internData.referralCode,
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              const Icon(
                                                Icons.copy_rounded,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6C5CE7).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.qr_code_rounded,
                                      color: Color(0xFF6C5CE7),
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Progress Card
                  AnimatedBuilder(
                    animation: _cardAnimations[1],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - _cardAnimations[1].value)),
                        child: Opacity(
                          opacity: _cardAnimations[1].value,
                          child: ProgressCard(
                            current: internData.totalDonations,
                            target: internData.monthlyGoal,
                            progressAnimation: _progressAnimation,
                            motivationalMessage: motivationalMessage,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Stats Grid
                  AnimatedBuilder(
                    animation: _cardAnimations[2],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - _cardAnimations[2].value)),
                        child: Opacity(
                          opacity: _cardAnimations[2].value,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.1,
                            children: [
                              StatCard(
                                title: 'Total Raised',
                                value: '₹${internData.totalDonations.toStringAsFixed(0)}',
                                icon: Icons.trending_up_rounded,
                                color: const Color(0xFF00D4AA),
                                subtitle: 'This month',
                                growth: '+15.2%',
                              ),
                              StatCard(
                                title: 'Current Rank',
                                value: '#${internData.rank}',
                                icon: Icons.emoji_events_rounded,
                                color: const Color(0xFFFFB347),
                                subtitle: 'Out of 50',
                                growth: '+2 positions',
                              ),
                              StatCard(
                                title: 'Referrals',
                                value: '${internData.totalReferrals}',
                                icon: Icons.people_rounded,
                                color: const Color(0xFFFD79A8),
                                subtitle: 'Active donors',
                                growth: '+3 this week',
                              ),
                              StatCard(
                                title: 'Rewards',
                                value: '${internData.rewards.where((r) => r.isUnlocked).length}',
                                icon: Icons.star_rounded,
                                color: const Color(0xFF74B9FF),
                                subtitle: 'Unlocked',
                                growth: '+2 new',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Rewards Section
                  AnimatedBuilder(
                    animation: _cardAnimations[3],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - _cardAnimations[3].value)),
                        child: Opacity(
                          opacity: _cardAnimations[3].value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Achievements',
                                    style: GoogleFonts.inter(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF2D3748),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF6C5CE7).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'View All',
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF6C5CE7),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 160,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: internData.rewards.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: index < internData.rewards.length - 1 ? 16 : 0,
                                      ),
                                      child: RewardCard(
                                        reward: internData.rewards[index],
                                        animationDelay: index * 100,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Quick Actions
                  AnimatedBuilder(
                    animation: _cardAnimations[4],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - _cardAnimations[4].value)),
                        child: Opacity(
                          opacity: _cardAnimations[4].value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quick Actions',
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF2D3748),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.3,
                                children: [
                                  _buildActionCard(
                                    'Share Code',
                                    Icons.share_rounded,
                                    const Color(0xFF6C5CE7),
                                    () => _showShareSuccess(),
                                  ),
                                  _buildActionCard(
                                    'Analytics',
                                    Icons.analytics_rounded,
                                    const Color(0xFF00D4AA),
                                    () => _showComingSoon('Analytics'),
                                  ),
                                  _buildActionCard(
                                    'Donate Now',
                                    Icons.favorite_rounded,
                                    const Color(0xFFE17055),
                                    () => _showComingSoon('Donation Page'),
                                  ),
                                  _buildActionCard(
                                    'Support',
                                    Icons.support_agent_rounded,
                                    const Color(0xFFFFB347),
                                    () => _showComingSoon('Support Chat'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: const Color(0xFF2D3748),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShareSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              'Referral code shared successfully!',
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF00D4AA),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info_rounded, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              '$feature coming soon!',
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF6C5CE7),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
