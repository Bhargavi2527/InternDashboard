import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/intern_data.dart';
import 'glass_container.dart';

class RewardCard extends StatefulWidget {
  final Reward reward;
  final int animationDelay;

  const RewardCard({
    super.key,
    required this.reward,
    this.animationDelay = 0,
  });

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    Future.delayed(Duration(milliseconds: widget.animationDelay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showRewardDetails,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                color: widget.reward.isUnlocked 
                    ? Colors.white 
                    : Colors.grey[50],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.reward.isUnlocked
                      ? widget.reward.color.withOpacity(0.3)
                      : Colors.grey[300]!,
                  width: 2,
                ),
                boxShadow: widget.reward.isUnlocked
                    ? [
                        BoxShadow(
                          color: widget.reward.color.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: widget.reward.isUnlocked
                            ? widget.reward.color.withOpacity(0.1)
                            : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.reward.icon,
                        color: widget.reward.isUnlocked 
                            ? widget.reward.color 
                            : Colors.grey[400],
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.reward.title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.reward.isUnlocked
                            ? const Color(0xFF2D3748)
                            : Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: widget.reward.isUnlocked
                            ? const Color(0xFF00D4AA).withOpacity(0.1)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.reward.isUnlocked ? 'Unlocked' : 'Locked',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: widget.reward.isUnlocked
                              ? const Color(0xFF00D4AA)
                              : Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showRewardDetails() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: widget.reward.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.reward.icon,
                  color: widget.reward.color,
                  size: 48,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.reward.title,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D3748),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: widget.reward.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.reward.category,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: widget.reward.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.reward.description,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF718096),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: widget.reward.isUnlocked
                      ? const Color(0xFF00D4AA).withOpacity(0.1)
                      : const Color(0xFFFFB347).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.reward.isUnlocked 
                          ? Icons.check_circle_rounded
                          : Icons.lock_rounded,
                      color: widget.reward.isUnlocked
                          ? const Color(0xFF00D4AA)
                          : const Color(0xFFFFB347),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.reward.isUnlocked ? 'Achievement Unlocked!' : 'Keep Going!',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.reward.isUnlocked
                            ? const Color(0xFF00D4AA)
                            : const Color(0xFFFFB347),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [widget.reward.color, widget.reward.color.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Close',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
