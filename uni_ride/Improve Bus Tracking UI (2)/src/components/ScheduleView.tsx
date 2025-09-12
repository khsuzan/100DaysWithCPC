import { useState } from "react";
import { Button } from "./ui/button";
import { Badge } from "./ui/badge";
import { 
  ArrowLeft, 
  Clock, 
  MapPin,
  Calendar,
  Download,
  Bell,
  MoreHorizontal
} from "lucide-react";

interface ScheduleViewProps {
  onBack: () => void;
}

export function ScheduleView({ onBack }: ScheduleViewProps) {
  const [selectedDay, setSelectedDay] = useState("today");

  const schedules = {
    "route-a": {
      name: "Route A",
      weekday: [
        { time: "7:00 AM", stop: "Main Gate", status: "completed" },
        { time: "7:15 AM", stop: "Student Center", status: "completed" },
        { time: "7:30 AM", stop: "Science Building", status: "current" },
        { time: "7:45 AM", stop: "Library", status: "upcoming" },
        { time: "8:00 AM", stop: "Sports Complex", status: "upcoming" },
        { time: "8:15 AM", stop: "Dining Hall", status: "upcoming" },
        { time: "8:30 AM", stop: "Dormitory A", status: "upcoming" },
        { time: "8:45 AM", stop: "Parking Lot C", status: "upcoming" }
      ],
      weekend: [
        { time: "9:00 AM", stop: "Main Gate", status: "upcoming" },
        { time: "9:30 AM", stop: "Student Center", status: "upcoming" },
        { time: "10:00 AM", stop: "Library", status: "upcoming" },
        { time: "10:30 AM", stop: "Dining Hall", status: "upcoming" }
      ]
    },
    "route-b": {
      name: "Route B", 
      weekday: [
        { time: "7:10 AM", stop: "North Campus", status: "completed" },
        { time: "7:25 AM", stop: "Engineering Building", status: "current" },
        { time: "7:40 AM", stop: "Medical Center", status: "upcoming" },
        { time: "7:55 AM", stop: "Library", status: "upcoming" },
        { time: "8:10 AM", stop: "Student Center", status: "upcoming" },
        { time: "8:25 AM", stop: "Main Gate", status: "upcoming" }
      ],
      weekend: [
        { time: "9:15 AM", stop: "North Campus", status: "upcoming" },
        { time: "9:45 AM", stop: "Engineering Building", status: "upcoming" },
        { time: "10:15 AM", stop: "Library", status: "upcoming" }
      ]
    }
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case "completed": return "text-gray-500";
      case "current": return "text-blue-600 font-semibold";
      case "upcoming": return "text-foreground";
      default: return "text-foreground";
    }
  };

  const getStatusIcon = (status: string) => {
    switch (status) {
      case "completed": return "✓";
      case "current": return "🚌";
      case "upcoming": return "⏱️";
      default: return "";
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
              <h1 className="text-lg">Bus Schedules</h1>
              <p className="text-sm text-gray-500">All routes and timings</p>
            </div>
          </div>
          <div className="flex space-x-2">
            <Button variant="ghost" size="icon" className="rounded-full">
              <Download className="w-5 h-5" />
            </Button>
            <Button variant="ghost" size="icon" className="rounded-full">
              <MoreHorizontal className="w-5 h-5" />
            </Button>
          </div>
        </div>
      </div>

      <div className="px-4 pt-4">
        {/* Quick Stats */}
        <div className="bg-white rounded-3xl p-6 mb-6 shadow-sm border border-gray-100">
          <h2 className="text-lg mb-4">Today's Overview</h2>
          <div className="grid grid-cols-3 gap-4">
            <div className="text-center">
              <div className="w-12 h-12 bg-gray-100 rounded-2xl flex items-center justify-center mx-auto mb-2">
                <span className="text-xl">🚌</span>
              </div>
              <p className="text-2xl text-black">4</p>
              <p className="text-xs text-gray-500">Active Routes</p>
            </div>
            <div className="text-center">
              <div className="w-12 h-12 bg-gray-100 rounded-2xl flex items-center justify-center mx-auto mb-2">
                <span className="text-xl">📍</span>
              </div>
              <p className="text-2xl text-black">12</p>
              <p className="text-xs text-gray-500">Stops Today</p>
            </div>
            <div className="text-center">
              <div className="w-12 h-12 bg-gray-100 rounded-2xl flex items-center justify-center mx-auto mb-2">
                <span className="text-xl">⚠️</span>
              </div>
              <p className="text-2xl text-black">3</p>
              <p className="text-xs text-gray-500">Delays</p>
            </div>
          </div>
        </div>

        {/* Day Selector */}
        <div className="flex bg-gray-100 rounded-2xl p-1 mb-6 border border-gray-200">
          <button
            onClick={() => setSelectedDay("today")}
            className={`flex-1 py-3 px-4 rounded-xl transition-all duration-200 ${
              selectedDay === "today" 
                ? 'bg-white text-black shadow-sm' 
                : 'text-gray-600 hover:text-gray-900'
            }`}
          >
            Today (Weekday)
          </button>
          <button
            onClick={() => setSelectedDay("weekend")}
            className={`flex-1 py-3 px-4 rounded-xl transition-all duration-200 ${
              selectedDay === "weekend" 
                ? 'bg-white text-black shadow-sm' 
                : 'text-gray-600 hover:text-gray-900'
            }`}
          >
            Weekend
          </button>
        </div>

        {/* Schedule Cards */}
        <div className="space-y-4">
          {Object.entries(schedules).map(([routeId, route]) => (
            <div key={routeId} className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100">
              <div className="flex items-center justify-between mb-6">
                <h3 className="text-lg">{route.name}</h3>
                <Button variant="outline" size="sm" className="rounded-full border-gray-300">
                  <Bell className="w-4 h-4 mr-1" />
                  Alert
                </Button>
              </div>
              
              <div className="space-y-3">
                {(selectedDay === "today" ? route.weekday : route.weekend).map((schedule, index) => (
                  <div 
                    key={index}
                    className={`flex items-center justify-between p-4 rounded-2xl transition-all duration-200 border ${
                      schedule.status === 'current' ? 'bg-gray-50 border-black' : 
                      schedule.status === 'completed' ? 'bg-gray-50 border-gray-200' : 'bg-gray-50 hover:bg-gray-100 border-gray-200'
                    }`}
                  >
                    <div className="flex items-center space-x-4">
                      <div className="w-8 h-8 rounded-full flex items-center justify-center text-lg">
                        {getStatusIcon(schedule.status)}
                      </div>
                      <div>
                        <p className={`text-lg ${getStatusColor(schedule.status)}`}>
                          {schedule.time}
                        </p>
                        <div className="flex items-center text-sm text-gray-500">
                          <MapPin className="w-3 h-3 mr-1" />
                          {schedule.stop}
                        </div>
                      </div>
                    </div>
                    <div>
                      {schedule.status === 'current' && (
                        <Badge className="bg-black text-white px-3 py-1 rounded-full">
                          🚌 Now
                        </Badge>
                      )}
                      {schedule.status === 'upcoming' && (
                        <Badge variant="outline" className="px-3 py-1 rounded-full border-gray-300">
                          ⏰ Upcoming
                        </Badge>
                      )}
                      {schedule.status === 'completed' && (
                        <Badge className="bg-gray-200 text-gray-700 px-3 py-1 rounded-full">
                          ✅ Done
                        </Badge>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>

        {/* Service Notice */}
        <div className="bg-gray-100 rounded-3xl p-6 mt-6 border border-gray-200 mb-24">
          <div className="flex items-start space-x-3">
            <div className="w-10 h-10 bg-gray-200 rounded-2xl flex items-center justify-center">
              <Calendar className="w-5 h-5 text-gray-600" />
            </div>
            <div>
              <h4 className="text-black mb-1">Service Notice</h4>
              <p className="text-sm text-gray-600">
                Weekend schedules may vary. Check for updates on holidays and special events.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}