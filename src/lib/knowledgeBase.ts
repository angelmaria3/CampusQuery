// CampusQuery Knowledge Base
// Modular structure ready for backend/database integration

export interface KnowledgeEntry {
  keywords: string[];
  response: string;
  category: string;
}

export const knowledgeBase: KnowledgeEntry[] = [
  // Exam Registration & Fee Deadlines
  {
    keywords: ["exam registration", "register exam", "exam form", "registration deadline"],
    response: "📝 **Exam Registration Information**\n\nThe exam registration portal opens on the 1st of every month and closes on the 15th. Regular registration fee is ₹500 per subject.\n\n**Key Dates:**\n- Regular Registration: 1st - 15th of the month\n- Late Registration: 16th - 20th (with ₹200 late fee)\n- Last Date with Fine: 21st - 25th (with ₹500 fine)\n\nYou can register through the student portal or visit the examination cell.",
    category: "exam"
  },
  {
    keywords: ["fee", "fees", "fee deadline", "payment", "tuition", "semester fee"],
    response: "💰 **Fee Payment Information**\n\n**Tuition Fees (Per Semester):**\n- Regular: ₹45,000\n- Management Quota: ₹65,000\n\n**Payment Deadlines:**\n- Without Fine: Before 30th of the first month\n- With Late Fee (₹1,000): By 15th of second month\n- With Fine (₹2,500): By end of second month\n\n**Payment Methods:** Online banking, UPI, or at the accounts office (Block A, Ground Floor).",
    category: "exam"
  },
  {
    keywords: ["late fee", "fine", "penalty"],
    response: "⚠️ **Late Fee Structure**\n\n**Exam Registration Late Fees:**\n- 16th-20th: ₹200 additional\n- 21st-25th: ₹500 additional\n\n**Semester Fee Late Fees:**\n- First 15 days: ₹1,000\n- After 15 days: ₹2,500\n\nTo avoid late fees, mark your calendar and set reminders!",
    category: "exam"
  },

  // Attendance Rules
  {
    keywords: ["attendance", "attendance percentage", "minimum attendance", "attendance requirement"],
    response: "📊 **Attendance Requirements**\n\n**Minimum Required:** 75% attendance in each subject\n\n**Shortage Consequences:**\n- 65-74%: Warning letter\n- 55-64%: Condonation required (₹500 per subject)\n- Below 55%: Detained, cannot appear for exams\n\n**Tracking:** Check your attendance on the student portal under 'Academic Records'.",
    category: "attendance"
  },
  {
    keywords: ["shortage", "attendance shortage", "low attendance"],
    response: "⚠️ **Attendance Shortage Policy**\n\nIf your attendance falls below 75%:\n\n1. **65-74%:** You'll receive a warning letter\n2. **55-64%:** Apply for condonation (₹500 fee per subject)\n3. **Below 55%:** Detention - you cannot appear for semester exams\n\n**Tip:** Regularly check your attendance and attend remedial classes if offered.",
    category: "attendance"
  },

  // Department Information
  {
    keywords: ["department", "departments", "faculty", "hod", "head of department"],
    response: "🏢 **Department Information**\n\n**Computer Science (CSE)**\n- HOD: Dr. Rajesh Kumar\n- Block B, 2nd Floor\n- Contact: cse@college.edu\n\n**Electronics (ECE)**\n- HOD: Dr. Priya Sharma\n- Block C, 1st Floor\n- Contact: ece@college.edu\n\n**Mechanical (ME)**\n- HOD: Dr. Suresh Patel\n- Workshop Block\n- Contact: mech@college.edu\n\n**Civil (CE)**\n- HOD: Dr. Meena Reddy\n- Block A, 3rd Floor\n- Contact: civil@college.edu",
    category: "department"
  },
  {
    keywords: ["cse", "computer science", "cs department"],
    response: "💻 **Computer Science Department (CSE)**\n\n**Head of Department:** Dr. Rajesh Kumar\n**Location:** Block B, 2nd Floor\n**Email:** cse@college.edu\n**Phone:** +91-XXXXX-12345\n\n**Labs:** 3 computer labs with 60 systems each\n**Specializations:** AI/ML, Data Science, Cybersecurity, Cloud Computing\n\n**Office Hours:** Mon-Fri, 9 AM - 5 PM",
    category: "department"
  },

  // College & Department Events
  {
    keywords: ["event", "events", "fest", "festival", "symposium", "cultural"],
    response: "🎉 **Upcoming Events**\n\n**TechFest 2026**\n- Date: February 15-17, 2026\n- Venue: Main Auditorium & Open Grounds\n- Highlights: Hackathon, Robotics, Paper Presentation\n\n**Cultural Night - Rhythms**\n- Date: February 28, 2026\n- Venue: College Amphitheatre\n- Events: Dance, Music, Fashion Show\n\n**Department Symposium (CSE)**\n- Date: March 5, 2026\n- Venue: Block B Seminar Hall\n- Topics: AI in Healthcare, Cloud Computing",
    category: "events"
  },
  {
    keywords: ["hackathon", "coding", "competition"],
    response: "💻 **Hackathon Details**\n\n**Annual Hackathon 2026**\n- Date: February 15-16, 2026\n- Venue: Computer Lab Complex, Block B\n- Duration: 24 hours\n- Team Size: 2-4 members\n- Registration Fee: ₹200 per team\n\n**Prizes:**\n- 1st Place: ₹25,000\n- 2nd Place: ₹15,000\n- 3rd Place: ₹10,000\n\nRegister through the CSE department portal.",
    category: "events"
  },

  // Condonation
  {
    keywords: ["condonation", "condone", "attendance condonation"],
    response: "📄 **Condonation Process**\n\n**Eligibility:** Students with 55-74% attendance\n\n**Steps:**\n1. Get attendance shortage report from class advisor\n2. Collect condonation form from examination cell\n3. Pay ₹500 per subject at accounts office\n4. Submit form with payment receipt to HOD\n5. Collect approved form within 3 working days\n\n**Deadline:** Must be completed 1 week before exams\n\n**Documents Required:** ID card, attendance report, fee receipt",
    category: "condonation"
  },
  {
    keywords: ["condonation fee", "condonation charge"],
    response: "💵 **Condonation Fee Structure**\n\n- **Per Subject:** ₹500\n- **Maximum Subjects:** 3 per semester\n\n**Payment Location:** Accounts Office, Block A, Ground Floor\n**Timings:** Mon-Fri, 10 AM - 4 PM\n\n**Note:** Keep the payment receipt safe - you'll need it for form submission.",
    category: "condonation"
  },

  // General Exam Rules
  {
    keywords: ["exam rules", "examination", "exam hall", "exam guidelines"],
    response: "📘 **General Examination Rules**\n\n**Before Exam:**\n- Reach 30 minutes before scheduled time\n- Carry hall ticket and college ID\n- No electronic devices allowed\n\n**During Exam:**\n- No communication with other students\n- Raise hand for any assistance\n- Answer sheets must not be torn\n\n**After Exam:**\n- Remain seated until papers are collected\n- Sign the attendance sheet\n- Return all materials including rough sheets",
    category: "general"
  },
  {
    keywords: ["hall ticket", "admit card"],
    response: "🎫 **Hall Ticket Information**\n\n**Download:** Available on student portal 1 week before exams\n\n**Requirements:**\n- No dues certificate\n- Exam registration complete\n- Minimum attendance met (or condonation approved)\n\n**Lost Hall Ticket:** Apply for duplicate at examination cell (₹100 fee)\n\n**Note:** Hall ticket is mandatory for entry to examination hall.",
    category: "general"
  },
  {
    keywords: ["result", "results", "grades", "grade"],
    response: "📊 **Results & Grading**\n\n**Results Declaration:** Usually 3-4 weeks after exams\n**Portal:** Check on student portal under 'Results'\n\n**Grading System:**\n- O (Outstanding): 90-100%\n- A+ (Excellent): 80-89%\n- A (Very Good): 70-79%\n- B+ (Good): 60-69%\n- B (Above Average): 50-59%\n- C (Pass): 40-49%\n- F (Fail): Below 40%",
    category: "general"
  },

  // Greetings and general
  {
    keywords: ["hello", "hi", "hey", "good morning", "good afternoon"],
    response: "👋 Hello! Welcome to CampusQuery - your one-stop college help bot!\n\nI can help you with:\n- 📝 Exam registration & fee deadlines\n- 🕒 Attendance rules\n- 🏢 Department information\n- 🎉 College events\n- 📄 Condonation procedures\n- 📘 General exam rules\n\nWhat would you like to know?",
    category: "general"
  },
  {
    keywords: ["thank", "thanks", "thank you"],
    response: "You're welcome! 😊 Is there anything else I can help you with regarding your campus queries?",
    category: "general"
  },
  {
    keywords: ["help", "what can you do", "how do i use"],
    response: "🤖 **How CampusQuery Works**\n\nI'm here to answer your college-related questions! Simply type your query in natural language.\n\n**Example Questions:**\n- \"What is the exam registration deadline?\"\n- \"How much is the late fee?\"\n- \"What events are coming up?\"\n- \"What's the minimum attendance required?\"\n\nI'll search my knowledge base and provide you with accurate information!",
    category: "general"
  }
];

// Intent detection function
export const detectIntent = (message: string): KnowledgeEntry | null => {
  const lowerMessage = message.toLowerCase();
  
  let bestMatch: KnowledgeEntry | null = null;
  let bestScore = 0;

  for (const entry of knowledgeBase) {
    let score = 0;
    for (const keyword of entry.keywords) {
      if (lowerMessage.includes(keyword.toLowerCase())) {
        score += keyword.split(' ').length; // Longer matches get higher scores
      }
    }
    if (score > bestScore) {
      bestScore = score;
      bestMatch = entry;
    }
  }

  return bestMatch;
};

// Get response based on user message
export const getResponse = (message: string): string => {
  const intent = detectIntent(message);
  
  if (intent) {
    return intent.response;
  }
  
  return "🤔 I'm not sure I understand your question. Could you please rephrase it?\n\nI can help with:\n- Exam registration & fees\n- Attendance rules\n- Department information\n- College events\n- Condonation procedures\n- General exam rules\n\nTry asking something like: \"What is the exam registration fee?\" or \"When is the next event?\"";
};
