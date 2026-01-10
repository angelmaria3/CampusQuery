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

serve(async (req) => {
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

      dataText = data?.map(a =>
        `${a.gender} students: Minimum ${a.min_percentage}% attendance required.\n${a.description}`
      ).join("\n\n") || "No attendance rules found.";
    }

    // ===== EXAM REGISTRATION & FEES =====
    else if (lower.includes("exam") && (lower.includes("fee") || lower.includes("registration"))) {
      const { data } = await supabase.from("exam_registration_fees").select("*");

      dataText = data?.map(d =>
        `📘 ${d.exam_name}\nDeadline: ${d.registration_deadline}\nFee: ₹${d.fee_amount}\nLate Fee: ₹${d.late_fee_amount}`
      ).join("\n\n") || "No exam registration data found.";
    }

    // ===== EVENTS =====
    else if (lower.includes("event")) {
      const { data } = await supabase.from("events").select("*");

      dataText = data?.map(e =>
        `🎉 ${e.event_name}\nDate: ${e.event_date}\nVenue: ${e.venue}`
      ).join("\n\n") || "No events found.";
    }

    // ===== DEPARTMENTS =====
    else if (lower.includes("department")) {
      const { data } = await supabase.from("department_info").select("*");

      dataText = data?.map(d =>
        `${d.department_name}\nHOD: ${d.hod_name}\n${d.description}`
      ).join("\n\n") || "No department info found.";
    }

    // ===== CONDONATION =====
    else if (lower.includes("condonation")) {
      const { data } = await supabase.from("condonation_rules").select("*");

      dataText = data?.map(c =>
        `Eligibility: ${c.eligibility}\nProcedure: ${c.procedure}\nFee: ₹${c.fee_amount}`
      ).join("\n\n") || "No condonation rules found.";
    }

    // ===== EXAM RULES =====
    else if (lower.includes("rule")) {
      const { data } = await supabase.from("exam_rules").select("*");

      dataText = data?.map(r =>
        `${r.rule_title}: ${r.rule_description}`
      ).join("\n\n") || "No exam rules found.";
    }

    else {
      dataText = "Please ask about attendance, exam registration, fees, events, departments, or condonation.";
    }

    // ===== GEMINI =====
    const geminiResponse = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${geminiKey}`,
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

    const geminiData = await geminiResponse.json();
    const finalText = geminiData.candidates?.[0]?.content?.parts?.[0]?.text || dataText;

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
