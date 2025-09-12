import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "./ui/card";
import { Button } from "./ui/button";
import { Badge } from "./ui/badge";
import { 
  ArrowLeft, 
  Star, 
  MapPin, 
  Clock,
  Trash2,
  Plus,
  Bell
} from "lucide-react";

interface FavoritesViewProps {
  onBack: () => void;
}

export function FavoritesView({ onBack }: FavoritesViewProps) {
  const [favoriteStops, setFavoriteStops] = useState([
    {
      id: "1",
      name: "Library",
      routes: ["Route A", "Route B"],
      nextBus: "3 min",
      status: "approaching",
      alertEnabled: true
    },
    {
      id: "2", 
      name: "Student Center",
      routes: ["Route A", "Route C"],
      nextBus: "8 min",
      status: "active",
      alertEnabled: false
    },
    {
      id: "3",
      name: "Dining Hall", 
      routes: ["Route B", "Route D"],
      nextBus: "15 min",
      status: "active",
      alertEnabled: true
    }
  ]);

  const [favoriteRoutes, setFavoriteRoutes] = useState([
    {
      id: "route-a",
      name: "Route A",
      nextArrival: "3 min",
      capacity: "few-seats",
      alertEnabled: true
    },
    {
      id: "route-b",
      name: "Route B", 
      nextArrival: "8 min",
      capacity: "empty",
      alertEnabled: false
    }
  ]);

  const removeFavoriteStop = (id: string) => {
    setFavoriteStops(favoriteStops.filter(stop => stop.id !== id));
  };

  const removeFavoriteRoute = (id: string) => {
    setFavoriteRoutes(favoriteRoutes.filter(route => route.id !== id));
  };

  const toggleAlert = (type: 'stop' | 'route', id: string) => {
    if (type === 'stop') {
      setFavoriteStops(favoriteStops.map(stop => 
        stop.id === id ? { ...stop, alertEnabled: !stop.alertEnabled } : stop
      ));
    } else {
      setFavoriteRoutes(favoriteRoutes.map(route =>
        route.id === id ? { ...route, alertEnabled: !route.alertEnabled } : route
      ));
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case "approaching": return "bg-blue-500";
      case "active": return "bg-green-500";
      case "delayed": return "bg-orange-500";
      default: return "bg-gray-500";
    }
  };

  const getCapacityColor = (capacity: string) => {
    switch (capacity) {
      case 'empty': return 'text-green-600 bg-green-50';
      case 'few-seats': return 'text-orange-600 bg-orange-50';
      case 'full': return 'text-red-600 bg-red-50';
      default: return 'text-gray-600 bg-gray-50';
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow-sm px-4 py-3 border-b border-gray-100">
        <div className="flex items-center space-x-3">
          <Button variant="ghost" size="icon" onClick={onBack} className="rounded-full">
            <ArrowLeft className="w-6 h-6" />
          </Button>
          <div>
            <h1 className="text-lg">My Favorites</h1>
            <p className="text-sm text-gray-500">Quick access to saved items</p>
          </div>
        </div>
      </div>

      <div className="px-4 pt-4 space-y-6">
        {/* Favorite Stops */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-lg flex items-center">
              <div className="w-8 h-8 bg-gray-100 rounded-2xl flex items-center justify-center mr-3">
                <Star className="w-4 h-4 text-black" />
              </div>
              Favorite Stops
            </h2>
            <Button variant="outline" size="sm" className="rounded-full border-gray-300">
              <Plus className="w-4 h-4 mr-1" />
              Add
            </Button>
          </div>
          
          <div className="space-y-4">
            {favoriteStops.length === 0 ? (
              <div className="text-center py-8">
                <div className="w-16 h-16 bg-gray-100 rounded-3xl flex items-center justify-center mx-auto mb-3">
                  <MapPin className="w-8 h-8 text-gray-400" />
                </div>
                <p className="text-gray-500 mb-1">No favorite stops yet</p>
                <p className="text-xs text-gray-400">Add stops for quick access</p>
              </div>
            ) : (
              favoriteStops.map((stop) => (
                <div key={stop.id} className="bg-gray-50 rounded-2xl p-4 border-l-4 border-l-black border border-gray-200">
                  <div className="flex items-center justify-between mb-3">
                    <div className="flex items-center space-x-3">
                      <div className={`w-4 h-4 rounded-full ${getStatusColor(stop.status)} ${
                        stop.status === 'approaching' ? 'animate-pulse' : ''
                      }`}></div>
                      <h4 className="text-lg">{stop.name}</h4>
                    </div>
                    <div className="flex items-center space-x-2">
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => toggleAlert('stop', stop.id)}
                        className={`rounded-full ${stop.alertEnabled ? 'text-black bg-gray-200' : 'text-gray-400'}`}
                      >
                        <Bell className="w-4 h-4" />
                      </Button>
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => removeFavoriteStop(stop.id)}
                        className="text-gray-500 hover:text-black rounded-full"
                      >
                        <Trash2 className="w-4 h-4" />
                      </Button>
                    </div>
                  </div>
                  
                  <div className="flex items-center justify-between">
                    <div className="flex items-center text-gray-600">
                      <Clock className="w-4 h-4 mr-2" />
                      <span className="text-sm">Next bus in</span>
                      <span className="ml-1 text-black">{stop.nextBus}</span>
                    </div>
                    <div className="flex space-x-2">
                      {stop.routes.map((route, index) => (
                        <Badge key={index} className="bg-white text-gray-700 px-2 py-1 rounded-full text-xs border border-gray-300">
                          {route}
                        </Badge>
                      ))}
                    </div>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        {/* Favorite Routes */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-lg flex items-center">
              <div className="w-8 h-8 bg-gray-100 rounded-2xl flex items-center justify-center mr-3">
                <Star className="w-4 h-4 text-black" />
              </div>
              Favorite Routes
            </h2>
            <Button variant="outline" size="sm" className="rounded-full border-gray-300">
              <Plus className="w-4 h-4 mr-1" />
              Add
            </Button>
          </div>
          
          <div className="space-y-4">
            {favoriteRoutes.length === 0 ? (
              <div className="text-center py-8">
                <div className="w-16 h-16 bg-gray-100 rounded-3xl flex items-center justify-center mx-auto mb-3">
                  <MapPin className="w-8 h-8 text-gray-400" />
                </div>
                <p className="text-gray-500 mb-1">No favorite routes yet</p>
                <p className="text-xs text-gray-400">Add routes for quick access</p>
              </div>
            ) : (
              favoriteRoutes.map((route) => (
                <div key={route.id} className="bg-gray-50 rounded-2xl p-4 border-l-4 border-l-black border border-gray-200">
                  <div className="flex items-center justify-between mb-3">
                    <h4 className="text-lg">{route.name}</h4>
                    <div className="flex items-center space-x-2">
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => toggleAlert('route', route.id)}
                        className={`rounded-full ${route.alertEnabled ? 'text-black bg-gray-200' : 'text-gray-400'}`}
                      >
                        <Bell className="w-4 h-4" />
                      </Button>
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => removeFavoriteRoute(route.id)}
                        className="text-gray-500 hover:text-black rounded-full"
                      >
                        <Trash2 className="w-4 h-4" />
                      </Button>
                    </div>
                  </div>
                  
                  <div className="flex items-center justify-between">
                    <div className="flex items-center text-gray-600">
                      <Clock className="w-4 h-4 mr-2" />
                      <span className="text-sm">Arriving in</span>
                      <span className="ml-1 text-black">{route.nextArrival}</span>
                    </div>
                    <Badge className={`${getCapacityColor(route.capacity)} px-3 py-1 rounded-full`}>
                      {route.capacity === 'few-seats' ? 'Few Seats' : route.capacity}
                    </Badge>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        {/* Alert Settings */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100 mb-24">
          <h2 className="text-lg flex items-center mb-6">
            <div className="w-8 h-8 bg-gray-100 rounded-2xl flex items-center justify-center mr-3">
              <Bell className="w-4 h-4 text-black" />
            </div>
            Alert Preferences
          </h2>
          
          <div className="space-y-4">
            <div className="flex items-center justify-between p-4 bg-gray-50 rounded-2xl border border-gray-200">
              <div>
                <p className="mb-1">Arrival Notifications</p>
                <p className="text-sm text-gray-500">Get notified when bus is approaching</p>
              </div>
              <div className="text-sm bg-gray-200 text-black px-3 py-1 rounded-full">
                {favoriteStops.filter(s => s.alertEnabled).length + favoriteRoutes.filter(r => r.alertEnabled).length} Active
              </div>
            </div>
            
            <div className="flex items-center justify-between p-4 bg-gray-50 rounded-2xl border border-gray-200">
              <div>
                <p className="mb-1">Delay Alerts</p>
                <p className="text-sm text-gray-500">Get notified about service delays</p>
              </div>
              <Badge className="bg-gray-200 text-black px-3 py-1 rounded-full">
                ✅ Enabled
              </Badge>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}