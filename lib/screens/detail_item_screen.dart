import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Required for go_router navigation

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  String _selectedSize = 'M'; // Default selected size based on Figma

  // Define reusable colors
  static const Color accentColor = Color(0xFFC67C4E);
  static const Color primaryTextColor = Color(0xFF2F2D2C);
  static const Color secondaryTextColor = Color(0xFFA9A9A9);
  static const Color lightGreyColor = Color(0xFFEAEAEA);
  static const Color selectedSizeBgColor = Color(0xFFFBEDDB); // Figma r:0.976, g:0.949, b:0.929
  static const Color starColor = Color(0xFFFBBE21); // Figma r:0.983, g:0.744, b:0.131
  static const Color superiorityBgColor = Color(0x59EDEDED); // Figma r:0.929, g:0.929, b:0.929, a:0.349

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                padding: EdgeInsets.zero, // Remove default ListView padding
                children: [
                  SizedBox(height: screenHeight * 0.02), // Spacing from top for app bar
                  _buildAppBar(context, screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildProductImage(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildProductDetail(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildDescription(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildSizeSelection(screenWidth),
                  SizedBox(height: screenHeight * 0.15), // Space for the bottom fixed action bar
                ],
              ),
            ),
            _buildBottomActionBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064), // 24/375
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRoundedIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {
              context.pop(); // Navigate back using go_router
            },
            size: 20, // Icon size
            containerSize: screenWidth * 0.117, // 44/375
            iconColor: primaryTextColor,
          ),
          Text(
            'Detail',
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primaryTextColor,
            ),
          ),
          _buildRoundedIconButton(
            icon: Icons.favorite_border_rounded,
            onTap: () {
              // Handle favorite button tap
            },
            size: 20,
            containerSize: screenWidth * 0.117, // 44/375
            iconColor: primaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedIconButton({
    required IconData icon,
    required VoidCallback onTap,
    required double size,
    required double containerSize,
    required Color iconColor,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Icon(icon, size: size, color: iconColor),
      ),
    );
  }

  Widget _buildProductImage(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064), // 24/375
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/I184_204_417_715.png',
          width: screenWidth * 0.872, // 327/375
          height: screenWidth * 0.5386, // 202/375
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductDetail(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Caffe Mocha',
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.0106), // 4px
                  Text(
                    'Ice/Hot',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.0426), // 16px
                  Row(
                    children: [
                      Icon(Icons.star_rounded, color: starColor, size: 20),
                      SizedBox(width: screenWidth * 0.0106), // 4px
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: primaryTextColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '4.8',
                              style: GoogleFonts.sora(
                                fontWeight: FontWeight.w600,
                                color: primaryTextColor,
                              ),
                            ),
                            TextSpan(
                              text: ' (230)',
                              style: GoogleFonts.sora(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  _buildSuperiorityIcon(
                    imagePath: 'assets/images/I184_198_418_950.png',
                    containerSize: screenWidth * 0.117, // 44/375
                    imageSize: 20, // Icon within a container
                  ),
                  SizedBox(width: screenWidth * 0.032), // 12px
                  _buildSuperiorityIcon(
                    imagePath: 'assets/images/I184_200_418_971.png',
                    containerSize: screenWidth * 0.117,
                    imageSize: 20,
                  ),
                  SizedBox(width: screenWidth * 0.032), // 12px
                  _buildSuperiorityIcon(
                    imagePath: 'assets/images/I184_202_418_967.png',
                    containerSize: screenWidth * 0.117,
                    imageSize: 20,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.0426), // 16px
          Divider(color: lightGreyColor, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildSuperiorityIcon({required String imagePath, required double containerSize, required double imageSize}) {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: superiorityBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        color: accentColor, // The Figma icons seem to be colored with accentColor
      ),
    );
  }

  Widget _buildDescription(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primaryTextColor,
            ),
          ),
          SizedBox(height: screenWidth * 0.0213), // 8px
          RichText(
            text: TextSpan(
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w300, // Light
                color: secondaryTextColor,
                height: 1.5, // Line height 21px / 14px font size
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                ),
                TextSpan(
                  text: 'Read More',
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600, // SemiBold
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelection(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primaryTextColor,
            ),
          ),
          SizedBox(height: screenWidth * 0.0426), // 16px
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['S', 'M', 'L'].map((size) {
              final isSelected = _selectedSize == size;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedSize = size;
                  });
                },
                child: Container(
                  width: screenWidth * 0.256, // 96/375
                  height: screenWidth * 0.109, // 41/375
                  decoration: BoxDecoration(
                    color: isSelected ? selectedSizeBgColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? accentColor : lightGreyColor,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    size,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? accentColor : primaryTextColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.145, // 118/812
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05), // Light shadow
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.064, // 24/375
          vertical: screenHeight * 0.0197, // 16/812
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0049), // 4/812
                Text(
                  '\$ 4.53',
                  style: GoogleFonts.sora(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.5786, // 217/375
              height: screenHeight * 0.069, // 56/812
              child: ElevatedButton(
                onPressed: () {
                  context.go('/checkout'); // Navigate to checkout screen using go_router
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}