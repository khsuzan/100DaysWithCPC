import { Badge } from "./ui/badge";
import { Clock, MapPin, Users, ChevronRight } from "lucide-react";

interface BusRouteCardProps {
  route: {
    id: string;
    name: string;
    status: 'active' | 'approaching' | 'delayed';
    nextArrival: string;
    capacity: 'empty' | 'few-seats' | 'full';
    stops: number;
    estimatedTime: string;
  };
  onClick: () => void;
}

export function BusRouteCard({ route, onClick }: BusRouteCardProps) {
  const getStatusColor = (status: string) => {
    switch (status) {
      case 'active': return 'bg-gray-600';
      case 'approaching': return 'bg-black animate-pulse';
      case 'delayed': return 'bg-gray-400';
      default: return 'bg-gray-500';
    }
  };

  const getStatusBg = (status: string) => {
    switch (status) {
      case 'active': return 'bg-gray-50';
      case 'approaching': return 'bg-gray-100';
      case 'delayed': return 'bg-gray-50';
      default: return 'bg-gray-50';
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

  const getCapacityText = (capacity: string) => {
    switch (capacity) {
      case 'empty': return 'Empty';
      case 'few-seats': return 'Few Seats';
      case 'full': return 'Full';
      default: return 'Unknown';
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
    <div 
      className={`cursor-pointer rounded-2xl p-5 transition-all duration-200 active:scale-[0.98] ${getStatusBg(route.status)} border-l-4 border border-gray-200 ${
        route.status === 'approaching' ? 'border-l-black' : 
        route.status === 'active' ? 'border-l-gray-600' : 'border-l-gray-400'
      }`}
      onClick={onClick}
    >
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center space-x-3">
          <div className={`w-4 h-4 rounded-full ${getStatusColor(route.status)}`}></div>
          <h3 className="text-lg">{route.name}</h3>
        </div>
        <ChevronRight className="w-5 h-5 text-gray-400" />
      </div>
      
      <div className="space-y-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center text-gray-600">
            <Clock className="w-4 h-4 mr-2" />
            <span className="text-sm">Arriving in</span>
          </div>
          <span className="text-lg text-black">{route.nextArrival}</span>
        </div>
        
        <div className="flex items-center justify-between">
          <div className="flex items-center text-gray-600">
            <MapPin className="w-4 h-4 mr-2" />
            <span className="text-sm">{route.stops} stops • {route.estimatedTime}</span>
          </div>
          <Badge className={`${getCapacityColor(route.capacity)} px-3 py-1 rounded-full text-xs`}>
            <span className="mr-1">{getCapacityIcon(route.capacity)}</span>
            {getCapacityText(route.capacity)}
          </Badge>
        </div>
      </div>
    </div>
  );
}