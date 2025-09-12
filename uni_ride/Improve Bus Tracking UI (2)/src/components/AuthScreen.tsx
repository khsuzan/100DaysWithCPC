import { Button } from "./ui/button";
import { Input } from "./ui/input";
import { ImageWithFallback } from "./figma/ImageWithFallback";
import { Bus, Eye, EyeOff } from "lucide-react";
import { useState } from "react";

interface AuthScreenProps {
  onLogin: () => void;
}

export function AuthScreen({ onLogin }: AuthScreenProps) {
  const [showPassword, setShowPassword] = useState(false);

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

      {/* Main Content */}
      <div className="flex-1 flex flex-col justify-between px-6 pb-8">
        {/* Header Section */}
        <div className="flex-1 flex flex-col justify-center space-y-8">
          {/* App Icon */}
          <div className="flex justify-center">
            <div className="w-24 h-24 bg-black rounded-3xl flex items-center justify-center">
              <Bus className="w-12 h-12 text-white" />
            </div>
          </div>

          {/* Title */}
          <div className="text-center space-y-3">
            <h1 className="text-3xl text-black">Campus Transit</h1>
            <p className="text-gray-600 text-lg leading-relaxed px-4">
              Track your campus buses in real-time and never miss a ride
            </p>
          </div>
        </div>

        {/* Login Form */}
        <div className="space-y-6">
          <div className="space-y-4">
            <div className="relative">
              <Input
                type="email"
                placeholder="Email address"
                className="h-14 bg-gray-50 border-gray-200 text-black placeholder:text-gray-500 rounded-2xl px-6"
              />
            </div>
            
            <div className="relative">
              <Input
                type={showPassword ? "text" : "password"}
                placeholder="Password"
                className="h-14 bg-gray-50 border-gray-200 text-black placeholder:text-gray-500 rounded-2xl px-6 pr-14"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-500 hover:text-black"
              >
                {showPassword ? <EyeOff className="w-5 h-5" /> : <Eye className="w-5 h-5" />}
              </button>
            </div>
          </div>

          <div className="space-y-4">
            <Button 
              onClick={onLogin} 
              className="w-full h-14 bg-black text-white hover:bg-gray-800 rounded-2xl text-lg"
            >
              Sign In
            </Button>
            
            <div className="flex items-center space-x-4">
              <div className="flex-1 h-px bg-gray-200"></div>
              <span className="text-gray-500 text-sm">or</span>
              <div className="flex-1 h-px bg-gray-200"></div>
            </div>
            
            <Button 
              variant="outline" 
              className="w-full h-14 border-gray-300 text-black hover:bg-gray-50 rounded-2xl text-lg bg-transparent"
            >
              Create Account
            </Button>
          </div>

          {/* Footer */}
          <div className="text-center">
            <button className="text-gray-500 text-sm hover:text-black">
              Forgot your password?
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}