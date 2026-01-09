import { Link, useLocation } from "react-router-dom";
import { GraduationCap } from "lucide-react";

interface NavItem {
  label: string;
  path: string;
}

const Navbar = () => {
  const location = useLocation();

  const navItems: NavItem[] = [
    { label: "Home", path: "/" },
    { label: "Categories", path: "/categories" },
    { label: "Chat", path: "/chat" },
    { label: "About", path: "/about" },
    { label: "Help", path: "/help" },
  ];

  const isActive = (path: string) => location.pathname === path;

  return (
    <nav className="sticky top-0 z-50 bg-card/80 backdrop-blur-md border-b border-border">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          <Link to="/" className="flex items-center gap-2">
            <div className="icon-circle w-10 h-10">
              <GraduationCap className="w-5 h-5" />
            </div>
            <span className="font-serif font-bold text-xl text-foreground">CampusQuery</span>
          </Link>

          <div className="hidden md:flex items-center gap-1">
            {navItems.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className={`nav-link ${isActive(item.path) ? "nav-link-active" : ""}`}
              >
                {item.label}
              </Link>
            ))}
          </div>

          <div className="md:hidden flex items-center gap-1">
            {navItems.slice(0, 3).map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className={`nav-link text-xs px-2 ${isActive(item.path) ? "nav-link-active" : ""}`}
              >
                {item.label}
              </Link>
            ))}
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
