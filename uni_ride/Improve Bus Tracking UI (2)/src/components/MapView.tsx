import { useState } from "react";
import { Button } from "./ui/button";
import { Badge } from "./ui/badge";
import { 
  ArrowLeft, 
  Navigation, 
  MapPin, 
  Clock,
  Users,
  Star,
  Bell,
  MoreHorizontal
} from "lucide-react";

interface MapViewProps {
  routeId: string;
  onBack: () => void;
}

export function MapView({ routeId, onBack }: MapViewProps) {
  const [selectedStop, setSelectedStop] = useState<string | null>(null);

  // Mock bus data
  const busData = {
    "route-a": {
      name: "Route A",
      currentLocation: "Near Science Building",
      nextStop: "Library",
      capacity: "few-seats",
      eta: "3 min",
      stops: [
        { id: "1", name: "Main Gate", status: "passed", eta: "", favorite: false },
        { id: "2", name: "Student Center", status: "passed", eta: "", favorite: true },
        { id: "3", name: "Science Building", status: "current", eta: "Now", favorite: false },
        { id: "4", name: "Library", status: "upcoming", eta: "3 min", favorite: true },
        { id: "5", name: "Sports Complex", status: "upcoming", eta: "8 min", favorite: false },
        { id: "6", name: "Dining Hall", status: "upcoming", eta: "12 min", favorite: false },
        { id: "7", name: "Dormitory A", status: "upcoming", eta: "15 min", favorite: false },
        { id: "8", name: "Parking Lot C", status: "upcoming", eta: "18 min", favorite: false }
      ]
    }
  };

  const currentRoute = busData[routeId as keyof typeof busData] || busData["route-a"];

  const getStopStatusColor = (status: string) => {
    switch (status) {
      case "passed": return "bg-gray-300";
      case "current": return "bg-blue-500 animate-pulse";
      case "upcoming": return "bg-gray-200 border-2 border-gray-300";
      default: return "bg-gray-200";
    }
  };

  const getCapacityColor = (capacity: string) => {
    switch (capacity) {
      case 'empty': return 'text-gray-700 bg-gray-100';
      case 'few-seats': return 'text-black bg-gray-200';
      case 'full': return 'text-white bg-black';
      default: return 'text-gray-700 bg-gray-100';
    }
  };

  const getCapacityIcon = (capacity: string) => {
    switch (capacity) {
      case 'empty': return '○';
      case 'few-seats': return '◐';
      case 'full': return '●';
      default: return '○';
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow-sm px-4 py-3 border-b border-gray-100">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-3">
            <Button variant="ghost" size="icon" onClick={onBack} className="rounded-full">
              <ArrowLeft className="w-6 h-6" />
            </Button>
            <div>
              <h1 className="text-lg">{currentRoute.name}</h1>
              <p className="text-sm text-gray-500">{currentRoute.currentLocation}</p>
            </div>
          </div>
          <Button variant="ghost" size="icon" className="rounded-full">
            <MoreHorizontal className="w-6 h-6" />
          </Button>
        </div>
      </div>

      <div className="px-4 pt-4 space-y-6">
        {/* Bus Status Card */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center space-x-3">
              <div className="w-12 h-12 bg-gray-100 rounded-2xl flex items-center justify-center">
                <div className="w-4 h-4 bg-black rounded-full animate-pulse"></div>
              </div>
              <div>
                <h3 className="text-lg">Bus Status</h3>
                <p className="text-sm text-gray-500">Live tracking active</p>
              </div>
            </div>
            <Badge className={`${getCapacityColor(currentRoute.capacity)} px-3 py-2 rounded-full`}>
              <span className="mr-1">{getCapacityIcon(currentRoute.capacity)}</span>
              {currentRoute.capacity === 'few-seats' ? 'Few Seats' : currentRoute.capacity}
            </Badge>
          </div>
          
          <div className="grid grid-cols-2 gap-4 mt-6">
            <div className="bg-gray-50 rounded-2xl p-4 border border-gray-200">
              <p className="text-sm text-gray-600 mb-1">Next Stop</p>
              <p className="text-lg text-black">{currentRoute.nextStop}</p>
            </div>
            <div className="bg-gray-50 rounded-2xl p-4 border border-gray-200">
              <p className="text-sm text-gray-600 mb-1">ETA</p>
              <p className="text-lg text-black">{currentRoute.eta}</p>
            </div>
          </div>
        </div>

        {/* Interactive Map */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg flex items-center">
              <Navigation className="w-5 h-5 mr-2 text-black" />
              Live Map
            </h3>
            <Button variant="outline" size="sm" className="rounded-full border-gray-300">
              <MapPin className="w-4 h-4 mr-1" />
              Center
            </Button>
          </div>
          
          <div className="h-64 bg-gray-100 rounded-2xl flex items-center justify-center relative overflow-hidden border border-gray-200">
            {/* Animated bus icon */}
            <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
              <div className="w-8 h-8 bg-black rounded-lg flex items-center justify-center animate-bounce">
                <span className="text-white text-sm">🚌</span>
              </div>
            </div>
            
            {/* Route line */}
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="w-3/4 h-1 bg-gray-400 rounded-full opacity-50"></div>
            </div>
            
            <div className="text-center">
              <MapPin className="w-12 h-12 text-gray-400 mx-auto mb-2 opacity-50" />
              <p className="text-sm text-gray-500">Interactive map view</p>
              <p className="text-xs text-gray-400 mt-1">Real-time bus tracking</p>
            </div>
          </div>
        </div>

        {/* Route Timeline */}
        <div className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
          <h3 className="text-lg mb-6">Route Timeline</h3>
          <div className="space-y-4">
            {currentRoute.stops.map((stop, index) => (
              <div 
                key={stop.id} 
                className={`flex items-center space-x-4 p-4 rounded-2xl transition-all duration-200 border ${
                  selectedStop === stop.id ? 'bg-gray-50 border-gray-300' : 
                  stop.status === 'current' ? 'bg-gray-50 border-black' : 'hover:bg-gray-50 border-gray-200'
                }`}
                onClick={() => setSelectedStop(selectedStop === stop.id ? null : stop.id)}
              >
                <div className="relative">
                  <div className={`w-5 h-5 rounded-full ${getStopStatusColor(stop.status)} ${
                    stop.status === 'current' ? 'ring-4 ring-gray-200' : ''
                  }`}></div>
                  {index < currentRoute.stops.length - 1 && (
                    <div className="absolute top-5 left-1/2 transform -translate-x-1/2 w-0.5 h-8 bg-gray-200"></div>
                  )}
                </div>
                
                <div className="flex-1">
                  <div className="flex items-center space-x-2 mb-1">
                    <span className={`${stop.status === 'current' ? 'text-black' : 'text-gray-900'}`}>
                      {stop.name}
                    </span>
                    {stop.favorite && <Star className="w-4 h-4 text-black fill-current" />}
                  </div>
                  {stop.status === 'current' && (
                    <p className="text-xs text-black bg-gray-200 px-2 py-1 rounded-full inline-block">
                      🚌 Bus is here now
                    </p>
                  )}
                </div>
                
                <div className="text-right">
                  {stop.eta && (
                    <div className={`flex items-center px-3 py-1 rounded-full text-sm ${
                      stop.status === 'upcoming' ? 'bg-gray-100 text-gray-600' : 'text-gray-400'
                    }`}>
                      <Clock className="w-3 h-3 mr-1" />
                      {stop.eta}
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Action Buttons */}
        <div className="grid grid-cols-2 gap-4 pb-24">
          <Button className="h-14 rounded-2xl bg-black hover:bg-gray-800 text-white">
            <Star className="w-5 h-5 mr-2" />
            Save Stop
          </Button>
          <Button variant="outline" className="h-14 rounded-2xl border-2 border-gray-300 hover:bg-gray-50">
            <Bell className="w-5 h-5 mr-2" />
            Set Alert
          </Button>
        </div>
      </div>
    </div>
  );
}