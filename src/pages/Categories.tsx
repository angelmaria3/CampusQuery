import { Link } from "react-router-dom";
import { BookOpen, Clock, DollarSign, Building2, PartyPopper, FileText } from "lucide-react";
import Navbar from "@/components/Navbar";

interface Category {
  icon: React.ComponentType<{ className?: string }>;
  title: string;
  description: string;
  id: string;
}

const Categories = () => {
  const categories: Category[] = [
    {
      icon: BookOpen,
      title: "Exam Rules",
      description: "Examination procedures, schedules, and eligibility criteria",
      id: "exam"
    },
    {
      icon: Clock,
      title: "Attendance Rules",
      description: "Minimum attendance requirements and shortage policies",
      id: "attendance"
    },
    {
      icon: DollarSign,
      title: "Fee Deadlines",
      description: "Payment schedules, methods, and scholarship information",
      id: "fees"
    },
    {
      icon: Building2,
      title: "Department Information",
      description: "Faculty details, facilities, and contact information",
      id: "department"
    },
    {
      icon: PartyPopper,
      title: "College Events",
      description: "Upcoming fests, symposiums, and club activities",
      id: "events"
    },
    {
      icon: FileText,
      title: "Condonation",
      description: "Shortage condonation process and requirements",
      id: "condonation"
    }
  ];

  return (
    <div className="min-h-screen bg-background">
      <Navbar />
      
      <main className="container mx-auto px-4 py-12 md:py-16">
        <div className="text-center mb-12 animate-fade-in">
          <h1 className="font-serif text-4xl md:text-5xl font-bold text-foreground mb-4">
            Choose a Category
          </h1>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Select a topic you'd like to know more about. Our AI assistant will help you find the information you need.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-5xl mx-auto">
          {categories.map((category, index) => (
            <Link
              key={category.id}
              to={`/chat?category=${category.id}`}
              className="category-card animate-fade-in"
              style={{ animationDelay: `${index * 100}ms` }}
            >
              <div className="icon-circle">
                <category.icon className="w-6 h-6" />
              </div>
              <h3 className="font-semibold text-lg text-foreground">{category.title}</h3>
              <p className="text-sm text-muted-foreground">{category.description}</p>
            </Link>
          ))}
        </div>
      </main>
    </div>
  );
};

export default Categories;
