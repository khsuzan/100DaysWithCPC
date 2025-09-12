import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentStep = 0;

  final List<_OnboardingStep> onboardingSteps = [
    _OnboardingStep(
      icon: Icons.directions_bus,
      title: "Welcome to Campus Transit",
      description:
          "Never miss your bus again with real-time tracking and smart notifications.",
      image: "🚌",
    ),
    _OnboardingStep(
      icon: Icons.location_on,
      title: "Live Tracking",
      description:
          "See exactly where your bus is on the map and get accurate arrival times.",
      image: "📍",
    ),
    _OnboardingStep(
      icon: Icons.access_time,
      title: "Smart Schedules",
      description:
          "Access all bus schedules, save your favorites, and get delay notifications.",
      image: "⏰",
    ),
    _OnboardingStep(
      icon: Icons.star,
      title: "Personalized Experience",
      description:
          "Save your favorite stops and routes for quick access to what matters most.",
      image: "⭐",
    ),
  ];

  void nextStep() {
    if (currentStep < onboardingSteps.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      _onComplete();
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void skipToEnd() {
    _onComplete();
  }

  void _onComplete() {
    // TODO: Navigate to login or home
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final step = onboardingSteps[currentStep];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar Simulation
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        i == 2 ? Colors.black : Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            // Header with Skip and Progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 48,
                    child:
                        currentStep > 0
                            ? IconButton(
                              icon: const Icon(
                                Icons.chevron_left,
                                color: Colors.grey,
                              ),
                              onPressed: prevStep,
                            )
                            : null,
                  ),
                  Row(
                    children: List.generate(
                      onboardingSteps.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == currentStep ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              index == currentStep
                                  ? Colors.black
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: skipToEnd,
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Illustration
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[200]!, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          step.image,
                          style: const TextStyle(fontSize: 56),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Title & Description
                    Text(
                      step.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      step.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    // Feature Preview Cards
                    if (currentStep == 1) _RoutePreviewCard(),
                    if (currentStep == 2) _SchedulePreviewCard(),
                    if (currentStep == 3) _FavoritePreviewCard(),
                  ],
                ),
              ),
            ),
            // Bottom Action
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: nextStep,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentStep == onboardingSteps.length - 1
                                ? 'Get Started'
                                : 'Continue',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          if (currentStep != onboardingSteps.length - 1)
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (currentStep == 0)
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        'Swipe through to learn about key features',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingStep {
  final IconData icon;
  final String title;
  final String description;
  final String image;
  const _OnboardingStep({
    required this.icon,
    required this.title,
    required this.description,
    required this.image,
  });
}

class _RoutePreviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Route A',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Chip(
                label: Text('3 min', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Approaching Library Stop',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SchedulePreviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today's Schedule", style: TextStyle(fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '4 Active',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('9:30 AM', style: TextStyle(color: Colors.grey)),
              Text('Library Stop', style: TextStyle(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('10:15 AM', style: TextStyle(color: Colors.grey)),
              Text('Student Center', style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}

class _FavoritePreviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.black, size: 18),
                  SizedBox(width: 6),
                  Text('Library Stop', style: TextStyle(fontSize: 14)),
                ],
              ),
              const Text(
                '2 min',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.circle, size: 10, color: Colors.black),
              SizedBox(width: 6),
              Text(
                'Route A, Route C',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
