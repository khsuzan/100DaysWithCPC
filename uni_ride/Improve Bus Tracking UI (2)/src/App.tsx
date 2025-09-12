import { useState } from "react";
import { OnboardingScreen } from "./components/OnboardingScreen";
import { AuthScreen } from "./components/AuthScreen";
import { Dashboard } from "./components/Dashboard";
import { MapView } from "./components/MapView";
import { ScheduleView } from "./components/ScheduleView";
import { FavoritesView } from "./components/FavoritesView";
import { BottomNavigation } from "./components/BottomNavigation";

type Screen = "onboarding" | "auth" | "dashboard" | "map" | "schedule" | "favorites";

export default function App() {
  const [currentScreen, setCurrentScreen] = useState<Screen>("onboarding");
  const [selectedRoute, setSelectedRoute] = useState<string>("");
  const [activeTab, setActiveTab] = useState("home");

  const handleOnboardingComplete = () => {
    setCurrentScreen("auth");
  };

  const handleLogin = () => {
    setCurrentScreen("dashboard");
    setActiveTab("home");
  };

  const handleViewMap = (routeId: string) => {
    setSelectedRoute(routeId);
    setCurrentScreen("map");
    setActiveTab("map");
  };

  const handleViewSchedule = () => {
    setCurrentScreen("schedule");
    setActiveTab("schedule");
  };

  const handleViewFavorites = () => {
    setCurrentScreen("favorites");
    setActiveTab("favorites");
  };

  const handleBackToDashboard = () => {
    setCurrentScreen("dashboard");
    setActiveTab("home");
  };

  const handleTabChange = (tab: string) => {
    setActiveTab(tab);
    switch (tab) {
      case "home":
        setCurrentScreen("dashboard");
        break;
      case "map":
        setCurrentScreen("map");
        if (!selectedRoute) setSelectedRoute("route-a");
        break;
      case "schedule":
        setCurrentScreen("schedule");
        break;
      case "favorites":
        setCurrentScreen("favorites");
        break;
    }
  };

  if (currentScreen === "onboarding") {
    return <OnboardingScreen onComplete={handleOnboardingComplete} />;
  }

  if (currentScreen === "auth") {
    return <AuthScreen onLogin={handleLogin} />;
  }

  return (
    <div className="relative">
      {currentScreen === "dashboard" && (
        <Dashboard
          onViewMap={handleViewMap}
          onViewSchedule={handleViewSchedule}
          onViewFavorites={handleViewFavorites}
        />
      )}
      
      {currentScreen === "map" && (
        <MapView
          routeId={selectedRoute}
          onBack={handleBackToDashboard}
        />
      )}
      
      {currentScreen === "schedule" && (
        <ScheduleView onBack={handleBackToDashboard} />
      )}
      
      {currentScreen === "favorites" && (
        <FavoritesView onBack={handleBackToDashboard} />
      )}

      {currentScreen !== "auth" && (
        <BottomNavigation
          activeTab={activeTab}
          onTabChange={handleTabChange}
        />
      )}
    </div>
  );
}