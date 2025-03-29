import 'package:flutter/material.dart';
import 'package:musify/common/widgets/app_button.dart';
import 'package:musify/core/configs/theme/app_color.dart';

class Choosemode extends StatelessWidget {
  const Choosemode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/appbg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/mage_music-fill.png"),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/images/moon.png",
                              fit: BoxFit.cover, // Ensure proper scaling
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // Add spacing
                        const Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        ClipOval(
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/images/sun.png",
                              fit: BoxFit.cover, // Ensure proper scaling
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // Add spacing
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                AppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Choosemode(),
                      ),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

