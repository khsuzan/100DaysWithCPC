import { useState } from "react";
import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { Badge } from "./ui/badge";
import { BusRouteCard } from "./BusRouteCard";
import { 
  Search, 
  Bell,
  User,
  Map,
  Calendar,
  Star,
  Compass
} from "lucide-react";

interface DashboardProps {
  onViewMap: (routeId: string) => void;
  onViewSchedule: () => void;
  onViewFavorites: () => void;
}

export function Dashboard({ onViewMap, onViewSchedule, onViewFavorites }: DashboardProps) {
  const [searchQuery, setSearchQuery] = useState("");

  const routes = [
    {
      id: "route-a",
      name: "Route A",
      status: "approaching" as const,
      nextArrival: "3 min",
      capacity: "few-seats" as const,
      stops: 8,
      estimatedTime: "25 min"
    },
    {
      id: "route-b", 
      name: "Route B",
      status: "active" as const,
      nextArrival: "8 min",
      capacity: "empty" as const,
      stops: 6,
      estimatedTime: "18 min"
    },
    {
      id: "route-c",
      name: "Route C", 
      status: "delayed" as const,
      nextArrival: "12 min",
      capacity: "full" as const,
      stops: 10,
      estimatedTime: "32 min"
    },
    {
      id: "route-d",
      name: "Route D",
      status: "active" as const,
      nextArrival: "15 min", 
      capacity: "few-seats" as const,
      stops: 5,
      estimatedTime: "20 min"
    }
  ];

  const quickActions = [
    { 
      icon: Map, 
      label: "Live Map", 
      action: () => onViewMap("all")
    },
    { 
      icon: Calendar, 
      label: "Schedules", 
      action: onViewSchedule
    },
    { 
      icon: Star, 
      label: "Favorites", 
      action: onViewFavorites
    },
    { 
      icon: Compass, 
      label: "Routes", 
      action: () => {}
    }
  ];

  const filteredRoutes = routes.filter(route =>
    route.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Status Bar */}
      <div className="h-12 bg-white flex items-center justify-center border-b border-gray-100">
        <div className="text-black text-sm">9:41 AM</div>
      </div>

      {/* Header */}
      <div className="bg-white px-6 pt-4 pb-8 border-b border-gray-100">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h1 className="text-black text-2xl">Good morning!</h1>
            <p className="text-gray-600">Ready to catch your bus?</p>
          </div>
          <div className="flex space-x-3">
            <Button variant="ghost" size="icon" className="text-black hover:bg-gray-100 rounded-full">
              <Bell className="w-6 h-6" />
            </Button>
            <Button variant="ghost" size="icon" className="text-black hover:bg-gray-100 rounded-full">
              <User className="w-6 h-6" />
            </Button>
          </div>
        </div>

        {/* Search */}
        <div className="relative">
          <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
          <Input
            placeholder="Search routes or stops..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="h-12 pl-12 bg-gray-50 border-gray-200 rounded-2xl placeholder:text-gray-500"
          />
        </div>
      </div>

      <div className="px-6 -mt-4 space-y-6">
        {/* Quick Actions */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <h2 className="text-lg mb-4">Quick Actions</h2>
          <div className="grid grid-cols-2 gap-4">
            {quickActions.map((action, index) => (
              <Button
                key={index}
                variant="ghost"
                className="h-20 flex-col space-y-2 bg-gray-50 hover:bg-gray-100 rounded-2xl border border-gray-200"
                onClick={action.action}
              >
                <div className="w-10 h-10 bg-black rounded-2xl flex items-center justify-center">
                  <action.icon className="w-5 h-5 text-white" />
                </div>
                <span className="text-sm text-gray-700">{action.label}</span>
              </Button>
            ))}
          </div>
        </div>

        {/* Live Status */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-lg">Live Bus Status</h2>
            <Badge className="bg-gray-100 text-gray-700 px-3 py-1 rounded-full border border-gray-200">
              <div className="w-2 h-2 bg-black rounded-full mr-2 animate-pulse"></div>
              {filteredRoutes.length} Active
            </Badge>
          </div>
          <div className="space-y-4">
            {filteredRoutes.map((route) => (
              <BusRouteCard
                key={route.id}
                route={route}
                onClick={() => onViewMap(route.id)}
              />
            ))}
          </div>
        </div>

        {/* Recent Activity */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <h2 className="text-lg mb-4">Recent Activity</h2>
          <div className="space-y-4">
            <div className="flex items-start space-x-4">
              <div className="w-3 h-3 bg-black rounded-full mt-2 animate-pulse"></div>
              <div className="flex-1">
                <p className="text-sm">Route A approaching Library Stop</p>
                <p className="text-xs text-gray-500">2 minutes ago</p>
              </div>
            </div>
            <div className="flex items-start space-x-4">
              <div className="w-3 h-3 bg-gray-500 rounded-full mt-2"></div>
              <div className="flex-1">
                <p className="text-sm">Route C delayed due to traffic</p>
                <p className="text-xs text-gray-500">5 minutes ago</p>
              </div>
            </div>
            <div className="flex items-start space-x-4">
              <div className="w-3 h-3 bg-gray-400 rounded-full mt-2"></div>
              <div className="flex-1">
                <p className="text-sm">Route B service resumed</p>
                <p className="text-xs text-gray-500">10 minutes ago</p>
              </div>
            </div>
          </div>
        </div>

        {/* Safe area for bottom navigation */}
        <div className="h-24"></div>
      </div>
    </div>
  );
}