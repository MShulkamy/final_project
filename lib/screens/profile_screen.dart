import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../core/app_colors.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  Map<String, dynamic>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await _authService.getUserData();
    setState(() {
      _userData = data;
      _isLoading = false;
    });
  }

  Future<void> _handleSignOut() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Settings
                            },
                            icon: Icon(
                              Icons.settings_outlined,
                              color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Profile Avatar (Cartoonish Customer Service Representative)
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.support_agent,
                          size: 64,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // User Name
                    if (_userData != null) ...[
                      Text(
                        '${_userData!['firstName'] ?? ''} ${_userData!['lastName'] ?? ''}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userData!['email'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 40),
                    
                    // Profile Options
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildProfileOption(
                            context,
                            icon: Icons.person_outline,
                            title: 'Edit Profile',
                            onTap: () {
                              // Edit profile
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.shopping_bag_outlined,
                            title: 'My Orders',
                            onTap: () {
                              // My orders
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.favorite_border,
                            title: 'Wishlist',
                            onTap: () {
                              // Wishlist
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.location_on_outlined,
                            title: 'Shipping Address',
                            onTap: () {
                              // Shipping address
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.payment_outlined,
                            title: 'Payment Methods',
                            onTap: () {
                              // Payment methods
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            onTap: () {
                              // Notifications
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.help_outline,
                            title: 'Help & Support',
                            onTap: () {
                              // Help & Support
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 12),
                          
                          _buildProfileOption(
                            context,
                            icon: Icons.info_outline,
                            title: 'About',
                            onTap: () {
                              // About
                            },
                            isDarkMode: isDarkMode,
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Sign Out Button
                          CustomButton(
                            text: 'Sign Out',
                            onPressed: _handleSignOut,
                            backgroundColor: AppColors.error,
                            icon: Icons.logout,
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // App Version
                          const Text(
                            'Version 1.0.0',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.greyText,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.darkText : AppColors.lightText,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.greyText,
            ),
          ],
        ),
      ),
    );
  }
}
