import { useState } from "react";
import { Button } from "./ui/button";
import { Bus, MapPin, Clock, Star, ChevronRight, ChevronLeft } from "lucide-react";

interface OnboardingScreenProps {
  onComplete: () => void;
}

export function OnboardingScreen({ onComplete }: OnboardingScreenProps) {
  const [currentStep, setCurrentStep] = useState(0);

  const onboardingSteps = [
    {
      icon: Bus,
      title: "Welcome to Campus Transit",
      description: "Never miss your bus again with real-time tracking and smart notifications.",
      image: "🚌"
    },
    {
      icon: MapPin,
      title: "Live Tracking",
      description: "See exactly where your bus is on the map and get accurate arrival times.",
      image: "📍"
    },
    {
      icon: Clock,
      title: "Smart Schedules",
      description: "Access all bus schedules, save your favorites, and get delay notifications.",
      image: "⏰"
    },
    {
      icon: Star,
      title: "Personalized Experience",
      description: "Save your favorite stops and routes for quick access to what matters most.",
      image: "⭐"
    }
  ];

  const nextStep = () => {
    if (currentStep < onboardingSteps.length - 1) {
      setCurrentStep(currentStep + 1);
    } else {
      onComplete();
    }
  };

  const prevStep = () => {
    if (currentStep > 0) {
      setCurrentStep(currentStep - 1);
    }
  };

  const skipToEnd = () => {
    onComplete();
  };

  const currentStepData = onboardingSteps[currentStep];

  return (
    <div className="min-h-screen bg-white flex flex-col">
      {/* Status Bar Simulation */}
      <div className="h-12 flex items-center justify-center">
        <div className="flex space-x-1">
          <div className="w-1 h-1 bg-black/40 rounded-full"></div>
          <div className="w-1 h-1 bg-black/40 rounded-full"></div>
          <div className="w-1 h-1 bg-black rounded-full"></div>
          <div className="w-1 h-1 bg-black/40 rounded-full"></div>
          <div className="w-1 h-1 bg-black/40 rounded-full"></div>
        </div>
      </div>

      {/* Header with Skip */}
      <div className="flex justify-between items-center px-6 py-4">
        <div className="w-16">
          {currentStep > 0 && (
            <Button
              variant="ghost"
              size="sm"
              onClick={prevStep}
              className="text-gray-500 hover:text-black p-2"
            >
              <ChevronLeft className="w-5 h-5" />
            </Button>
          )}
        </div>
        <div className="flex space-x-2">
          {onboardingSteps.map((_, index) => (
            <div
              key={index}
              className={`w-2 h-2 rounded-full transition-all duration-300 ${
                index === currentStep ? 'bg-black w-6' : 'bg-gray-300'
              }`}
            />
          ))}
        </div>
        <div className="w-16 flex justify-end">
          <Button
            variant="ghost"
            size="sm"
            onClick={skipToEnd}
            className="text-gray-500 hover:text-black"
          >
            Skip
          </Button>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 flex flex-col justify-center px-6 space-y-8">
        {/* Illustration */}
        <div className="flex justify-center">
          <div className="w-32 h-32 bg-gray-100 rounded-full flex items-center justify-center border-2 border-gray-200">
            <span className="text-6xl">{currentStepData.image}</span>
          </div>
        </div>

        {/* Content */}
        <div className="text-center space-y-6 max-w-sm mx-auto">
          <div className="space-y-4">
            <h1 className="text-3xl text-black">{currentStepData.title}</h1>
            <p className="text-lg text-gray-600 leading-relaxed">
              {currentStepData.description}
            </p>
          </div>

          {/* Feature Preview Cards */}
          {currentStep === 1 && (
            <div className="bg-gray-50 rounded-2xl p-4 border border-gray-200 mt-8">
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm text-gray-600">Route A</span>
                <span className="text-sm bg-black text-white px-2 py-1 rounded-full">3 min</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-black rounded-full animate-pulse"></div>
                <span className="text-sm text-gray-800">Approaching Library Stop</span>
              </div>
            </div>
          )}

          {currentStep === 2 && (
            <div className="bg-gray-50 rounded-2xl p-4 border border-gray-200 mt-8">
              <div className="flex items-center justify-between mb-3">
                <span className="text-sm text-gray-800">Today's Schedule</span>
                <span className="text-xs bg-gray-200 text-gray-700 px-2 py-1 rounded-full">4 Active</span>
              </div>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">9:30 AM</span>
                  <span className="text-black">Library Stop</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">10:15 AM</span>
                  <span className="text-black">Student Center</span>
                </div>
              </div>
            </div>
          )}

          {currentStep === 3 && (
            <div className="bg-gray-50 rounded-2xl p-4 border border-gray-200 mt-8">
              <div className="flex items-center justify-between mb-2">
                <div className="flex items-center space-x-2">
                  <Star className="w-4 h-4 text-black fill-current" />
                  <span className="text-sm text-gray-800">Library Stop</span>
                </div>
                <span className="text-sm text-black">2 min</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-2 h-2 bg-black rounded-full"></div>
                <span className="text-xs text-gray-600">Route A, Route C</span>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Bottom Action */}
      <div className="px-6 pb-8 space-y-4">
        <Button
          onClick={nextStep}
          className="w-full h-14 bg-black text-white hover:bg-gray-800 rounded-2xl flex items-center justify-center"
        >
          {currentStep === onboardingSteps.length - 1 ? (
            "Get Started"
          ) : (
            <>
              Continue
              <ChevronRight className="w-5 h-5 ml-2" />
            </>
          )}
        </Button>

        {currentStep === 0 && (
          <div className="text-center">
            <p className="text-sm text-gray-500">
              Swipe through to learn about key features
            </p>
          </div>
        )}
      </div>
    </div>
  );
}