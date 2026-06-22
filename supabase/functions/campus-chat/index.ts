// @ts-nocheck
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
const supabaseKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const geminiKey = Deno.env.get("GEMINI_API_KEY")!;

const supabase = createClient(supabaseUrl, supabaseKey);

serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: corsHeaders });
  }

  try {
    const { query } = await req.json();
    const lower = query.toLowerCase();
    let dataText = "";

    // ===== ATTENDANCE =====
    if (lower.includes("attendance")) {
      const { data } = await supabase.from("attendance_rules").select("*");

      dataText = data?.map((a: any) =>
        `${a.gender} students: Minimum ${a.min_percentage}% attendance required.\n${a.description}`
      ).join("\n\n") || "No attendance rules found.";
    }

    // ===== EXAM REGISTRATION & FEES =====
    else if (lower.includes("exam") && (lower.includes("fee") || lower.includes("registration"))) {
      const { data } = await supabase.from("exam_registration_fees").select("*");

      dataText = data?.map((d: any) =>
        `📘 ${d.exam_name}\nDeadline: ${d.registration_deadline}\nFee: ₹${d.fee_amount}\nLate Fee: ₹${d.late_fee_amount}`
      ).join("\n\n") || "No exam registration data found.";
    }

    // ===== EVENTS =====
    else if (lower.includes("event")) {
      const { data } = await supabase.from("events").select("*");

      dataText = data?.map((e: any) =>
        `🎉 ${e.event_name}\nDate: ${e.event_date}\nVenue: ${e.venue}`
      ).join("\n\n") || "No events found.";
    }

    // ===== DEPARTMENTS =====
    else if (lower.includes("department")) {
      const { data } = await supabase.from("department_info").select("*");

      dataText = data?.map((d: any) =>
        `${d.department_name}\nHOD: ${d.hod_name}\n${d.description}`
      ).join("\n\n") || "No department info found.";
    }

    // ===== CONDONATION =====
    else if (lower.includes("condonation")) {
      const { data } = await supabase.from("condonation_rules").select("*");

      dataText = data?.map((c: any) =>
        `Eligibility: ${c.eligibility}\nProcedure: ${c.procedure}\nFee: ₹${c.fee_amount}`
      ).join("\n\n") || "No condonation rules found.";
    }

    // ===== MINOR SPECIALIZED DOMAINS =====
    else if (lower.includes("minor") && (lower.includes("domain") || lower.includes("specialized") || lower.includes("option") || lower.includes("subject") || lower.includes("what minors"))) {
      const { data } = await supabase.from("specialized_minor_domains").select("*");
      dataText = "Here are the specialized Minor domains offered under the 2024 scheme:\n\n" + 
        data?.map((d: any) => `• **${d.domain_name}**: ${d.description || "No description available."}`).join("\n") || "No specialized minor domains found.";
    }

    // ===== MINOR CURRICULUM & COURSE STRUCTURE =====
    else if (lower.includes("minor") && (lower.includes("curriculum") || lower.includes("structure") || lower.includes("semester") || lower.includes("credit") || lower.includes("course") || lower.includes("code"))) {
      const { data } = await supabase.from("minor_curriculum_courses").select("*");
      dataText = "KTU 2024 B.Tech Minor Course Structure and Credit Distribution:\n\n" +
        data?.map((c: any) => 
          `📊 **Semester ${c.semester}**:\n` +
          `  - Course Pattern: \`${c.course_code_pattern}\`\n` +
          `  - Credits: ${c.credits} (L-T-P: ${c.lecture_structure})\n` +
          `  - Weekly Hours: ${c.hours_per_week} hrs (Self-Study: ${c.self_study_hours} hrs)\n` +
          `  - Marks: CIE ${c.cia_marks} / ESE ${c.ese_marks}\n` +
          `  - Detail: ${c.description}`
        ).join("\n\n") || "No minor curriculum courses found.";
    }

    // ===== HONOURS CURRICULUM & COURSE STRUCTURE =====
    else if (lower.includes("honour") && (lower.includes("curriculum") || lower.includes("structure") || lower.includes("semester") || lower.includes("credit") || lower.includes("course") || lower.includes("code"))) {
      const { data } = await supabase.from("honours_curriculum_courses").select("*");
      dataText = "KTU 2024 B.Tech Honours Course Structure and Credit Distribution:\n\n" +
        data?.map((c: any) => 
          `📊 **Semester ${c.semester}**:\n` +
          `  - Course Pattern: \`${c.course_code_pattern}\`\n` +
          `  - Credits: ${c.credits} (L-T-P: ${c.lecture_structure})\n` +
          `  - Weekly Hours: ${c.hours_per_week} hrs (Self-Study: ${c.self_study_hours} hrs)\n` +
          `  - Marks: CIE ${c.cia_marks} / ESE ${c.ese_marks}\n` +
          `  - Detail: ${c.description}`
        ).join("\n\n") || "No honours curriculum courses found.";
    }

    // ===== GENERAL REGULATIONS & ACADEMIC RULES =====
    else if (
      lower.includes("rule") || 
      lower.includes("regulation") || 
      lower.includes("honour") || 
      lower.includes("minor") || 
      lower.includes("cgpa") || 
      lower.includes("sgpa") ||
      lower.includes("transfer") || 
      lower.includes("mooc") || 
      lower.includes("internship") || 
      lower.includes("grace") ||
      lower.includes("absence") ||
      lower.includes("challenge") ||
      lower.includes("assessment") ||
      lower.includes("migration")
    ) {
      const { data } = await supabase.from("academic_regulations").select("*");
      
      const keywords = ["honour", "minor", "cgpa", "sgpa", "transfer", "mooc", "internship", "grace", "absence", "challenge", "assessment", "migration", "duration", "mentoring", "pta", "attendance", "admission", "visit", "ombuds"];
      const matchedKeywords = keywords.filter(kw => lower.includes(kw));
      
      let filtered = data || [];
      if (matchedKeywords.length > 0) {
        filtered = filtered.filter((r: any) => {
          const content = `${r.category_name} ${r.rule_title} ${r.rule_description}`.toLowerCase();
          return matchedKeywords.some(kw => content.includes(kw));
        });
      }
      
      // Limit to 10 rules to avoid hitting context token limit
      filtered = filtered.slice(0, 10);
      
      dataText = filtered.map((r: any) =>
        `📍 [Section ${r.category_number}: ${r.category_name}] ${r.rule_code || ""} ${r.rule_title}: ${r.rule_description}`
      ).join("\n\n") || "No matching academic regulations found.";
    }

    else {
      dataText = "Please ask about attendance, exam registration, fees, events, departments, condonation, or general regulations like Honours, Minors, SGPA/CGPA, transfers, breaks of study, and internships.";
    }

    // ===== GEMINI =====
    let finalText = dataText;
    try {
      const geminiResponse = await fetch(
        `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${geminiKey}`,
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            contents: [{
              parts: [{ text: `Answer the student clearly using this data:\n${dataText}` }]
            }]
          })
        }
      );

      if (geminiResponse.ok) {
        const geminiData = await geminiResponse.json();
        const aiText = geminiData.candidates?.[0]?.content?.parts?.[0]?.text;
        if (aiText) {
          finalText = aiText;
        } else {
          console.warn("No text candidates found in Gemini response.");
        }
      } else {
        const errorText = await geminiResponse.text();
        console.error(`Gemini API error (Status ${geminiResponse.status}): ${errorText}`);
      }
    } catch (apiError) {
      console.error("Gemini connection error:", apiError);
    }

    return new Response(
      JSON.stringify({ response: finalText }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );

  } catch (error) {
    console.error("Error:", error);
    return new Response(
      JSON.stringify({ response: "Something went wrong. Please try again." }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
