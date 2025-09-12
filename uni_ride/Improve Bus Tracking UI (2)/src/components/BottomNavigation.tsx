import { 
  Home,
  Map,
  Calendar,
  Star
} from "lucide-react";

interface BottomNavigationProps {
  activeTab: string;
  onTabChange: (tab: string) => void;
}

export function BottomNavigation({ activeTab, onTabChange }: BottomNavigationProps) {
  const tabs = [
    { id: "home", label: "Home", icon: Home },
    { id: "map", label: "Map", icon: Map },
    { id: "schedule", label: "Schedule", icon: Calendar },
    { id: "favorites", label: "Favorites", icon: Star }
  ];

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-white/95 backdrop-blur-lg border-t border-gray-200">
      {/* Safe area indicator */}
      <div className="flex items-center justify-around py-3 px-6">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            className={`flex flex-col items-center space-y-1 py-2 px-4 rounded-2xl transition-all duration-200 ${
              activeTab === tab.id 
                ? 'text-black bg-gray-100 scale-105' 
                : 'text-gray-500 hover:text-gray-700 active:scale-95'
            }`}
            onClick={() => onTabChange(tab.id)}
          >
            <div className={`p-1 rounded-xl ${activeTab === tab.id ? 'bg-gray-200' : ''}`}>
              <tab.icon className={`w-6 h-6 ${activeTab === tab.id ? 'text-black' : ''}`} />
            </div>
            <span className={`text-xs ${activeTab === tab.id ? 'text-black' : ''}`}>
              {tab.label}
            </span>
            {activeTab === tab.id && (
              <div className="w-1 h-1 bg-black rounded-full"></div>
            )}
          </button>
        ))}
      </div>
      {/* Safe area bottom padding */}
      <div className="h-safe-bottom bg-white/95"></div>
    </div>
  );
}