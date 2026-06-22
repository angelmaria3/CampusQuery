-- ==========================================
-- Database Tables Schema & Seed Data
-- ==========================================

-- 1. Create Attendance Rules table
CREATE TABLE IF NOT EXISTS attendance_rules (
    id BIGSERIAL PRIMARY KEY,
    gender VARCHAR(50) NOT NULL,
    min_percentage INT NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 2. Create Exam Registration & Fees table
CREATE TABLE IF NOT EXISTS exam_registration_fees (
    id BIGSERIAL PRIMARY KEY,
    exam_name VARCHAR(255) NOT NULL,
    registration_deadline VARCHAR(100) NOT NULL,
    fee_amount NUMERIC(10, 2) NOT NULL,
    late_fee_amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 3. Create Events table
CREATE TABLE IF NOT EXISTS events (
    id BIGSERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date VARCHAR(100) NOT NULL,
    venue VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 4. Create Department Info table
CREATE TABLE IF NOT EXISTS department_info (
    id BIGSERIAL PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    hod_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 5. Create Condonation Rules table
CREATE TABLE IF NOT EXISTS condonation_rules (
    id BIGSERIAL PRIMARY KEY,
    eligibility TEXT NOT NULL,
    procedure TEXT NOT NULL,
    fee_amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 6. Create Exam Rules table
CREATE TABLE IF NOT EXISTS exam_rules (
    id BIGSERIAL PRIMARY KEY,
    rule_title VARCHAR(255) NOT NULL,
    rule_description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 7. Create Academic Regulations table for all 26 categories
CREATE TABLE IF NOT EXISTS academic_regulations (
    id BIGSERIAL PRIMARY KEY,
    category_number INT NOT NULL,
    category_name VARCHAR(255) NOT NULL,
    rule_code VARCHAR(50),
    rule_title VARCHAR(255) NOT NULL,
    rule_description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 8. Create table for Minor Curriculum Courses structure
CREATE TABLE IF NOT EXISTS minor_curriculum_courses (
    id BIGSERIAL PRIMARY KEY,
    semester INT NOT NULL,
    course_code_pattern VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    hours_per_week VARCHAR(50) NOT NULL,
    lecture_structure VARCHAR(50) NOT NULL,
    self_study_hours NUMERIC(4, 1) NOT NULL,
    cia_marks INT NOT NULL,
    ese_marks INT NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 9. Create table for Specialized Minor Domains
CREATE TABLE IF NOT EXISTS specialized_minor_domains (
    id BIGSERIAL PRIMARY KEY,
    domain_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);

-- 10. Create table for Honours Curriculum Courses structure
CREATE TABLE IF NOT EXISTS honours_curriculum_courses (
    id BIGSERIAL PRIMARY KEY,
    semester INT NOT NULL,
    course_code_pattern VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    hours_per_week VARCHAR(50) NOT NULL,
    lecture_structure VARCHAR(50) NOT NULL,
    self_study_hours NUMERIC(4, 1) NOT NULL,
    cia_marks INT NOT NULL,
    ese_marks INT NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::text, NOW()) NOT NULL
);
-- ==========================================
-- Insert Seed Data (KTU 2024 Scheme Regulations)
-- ==========================================

-- Attendance Rules
INSERT INTO attendance_rules (gender, min_percentage, description) VALUES
('All', 75, 'A minimum of 75% attendance is mandatory to be eligible to appear for the End Semester Examination (ESE) under the 2024 Academic Regulations (R 6.1.ii).'),
('Female', 73, 'Eligible female students are granted a 2% relaxation in attendance as Menstrual Leave, reducing the minimum required attendance to 73% (R 6.1.iii).'),
('PWD', 70, 'Students with disabilities (PWD) are granted a 5% relaxation in attendance, reducing the minimum required attendance to 70% (R 6.1.iv).'),
('Medical/Emergency (Condonation)', 60, 'In exceptional cases (medical reasons or personal emergencies), the Principal may condone attendance if it is less than 75% but greater than or equal to 60%, applicable for a maximum of two semesters (R 6.2).'),
('Duty Leave (Events)', 65, 'Students representing the college or zone in officially sponsored competitions/events are eligible for up to a 10% attendance relaxation (duty leave) (R 6.3).'),
('Duty Leave (Union/Organizing)', 65, 'College or University Union members organizing official events are eligible for up to a 10% attendance relaxation (duty leave) (R 6.4).');

-- Exam Registration & Fees (Campus Level Defaults)
INSERT INTO exam_registration_fees (exam_name, registration_deadline, fee_amount, late_fee_amount) VALUES
('Regular Semester Exams (Nov/Dec 2026)', 'November 15, 2026', 1800.00, 500.00),
('Supplementary Exams (Nov/Dec 2026)', 'November 20, 2026', 1000.00, 300.00),
('Practical & Lab Assessments (Oct 2026)', 'October 30, 2026', 500.00, 150.00);

-- Events (Campus Level Defaults)
INSERT INTO events (event_name, event_date, venue) VALUES
('Anokha TechFest 2026', 'October 12-14, 2026', 'Main Campus Auditorium & Lab Blocks'),
('Spardha Annual Sports Meet', 'November 3-5, 2026', 'Campus Main Playground & Stadium'),
('ByteCraft Hackathon', 'September 20-21, 2026', 'CSE Research & Innovation Lab');

-- Department Info (Campus Level Defaults)
INSERT INTO department_info (department_name, hod_name, description) VALUES
('Computer Science & Engineering', 'Dr. Alice Vance', 'Focuses on software development, AI, cyber security, and data structures. Office is in Block-A, First Floor.'),
('Mechanical Engineering', 'Dr. Bob Miller', 'Specializes in thermodynamics, robotics, machine design, and material science. Office is in Block-B, Ground Floor.'),
('Electrical & Electronics Engineering', 'Dr. Carol Smith', 'Focuses on power grids, microprocessors, and control systems. Office is in Block-C, Second Floor.');

-- Condonation Rules
INSERT INTO condonation_rules (eligibility, procedure, fee_amount) VALUES
('Attendance must be between 60% and 74.9% under exceptional cases (such as medical reasons or personal emergencies). This relaxation is applicable for a maximum of two semesters during the entire programme duration (R 6.2).', 'Submit an application through your respective Senior Faculty Advisor (SFA) and Head of Department (HOD) to the Principal with verified supporting documents (medical certificates/duty certificates) within ten days of returning.', 750.00);

-- Exam Rules
INSERT INTO exam_rules (rule_title, rule_description) VALUES
('B.Tech Program Structure & Degree Options', 'There are four options for completing the B.Tech program: (1) Regular B.Tech in an Engineering Major (170 Credits), (2) B.Tech with Minor (185 Credits, including 15 credits of Minor coursework), (3) B.Tech with Honours (185 Credits, including 15 credits of Honours coursework), and (4) B.Tech with Honours and Minor (200 Credits) (R 3.2).'),
('B.Tech Degree Credit Requirements', 'To graduate with a regular B.Tech degree, a student must acquire a total of 170 credits (167 academic credits + 3 mandatory student activity credits) (R 3.2, R 3.12).'),
('B.Tech Credit Relaxation Policy', 'A student who acquires at least 160 credits (157 academic credits + 3 activity credits) after 8 semesters is eligible for graduation. This allowance allows a shortfall of up to 10 credits, but excludes Seminar, Mini Project, and Major Project which are mandatory (R 3.3).'),
('Honours Credit Consideration Policy', 'If a student fails to acquire the minimum 160 credits required for a regular B.Tech degree under the credit relaxation policy, the credits earned from Honours theory courses, along with any Level 5 bonus credits, will be counted towards fulfilling the 160 credits. Students who benefit from this consideration will not be eligible for the award of the B.Tech degree with Honours (R 3.4).'),
('Academic Year Structure & Working Days', 'Every academic year consists of an Odd semester, an Even semester, and a Summer semester (reserved for internships/skills). Each semester must have a minimum of 90 working days, of which 65 days must be instructional days. Lost instructional days due to declared holidays must be rescheduled within the same semester, including on Saturdays (R 3.5).'),
('Syllabus Revision Guidelines', 'Syllabuses are typically updated once every four years. Modifications to core courses must not exceed 30% of their content. All syllabus revisions are made exclusively on the recommendations of the Board of Studies (BoS) and are subject to the approval of the Academic Council (R 3.11).'),
('Self-Study Hours (SS)', 'Self-study hours per week for each course are calculated as: 1.5 * L (Lecture) + 0.5 * T (Tutorial) + 0.5 * P (Practical) + R (Project) (R 3.14).'),
('Curriculum Course Categories Breakup', 'The B.Tech academic curriculum (167 academic credits) is broken down into 10 categories: HMC (9 credits), BSC (20 credits), ESC (29 credits), PCC (52 credits), PBL (16 credits), PEC (18 credits), OEC/ILE (9 credits), PWS (12 credits), HWP (1 credit), and SEC (1 credit) (R 3.15).'),
('Project-Based Learning (PBL) Rules', 'PBL is integrated across disciplines. The curriculum includes four project-based courses where students undertake projects in groups of exactly four members. Faculty members are assigned for assessment and evaluation at a ratio of one faculty member for every 20 students (R 3.17, R 3.44).'),
('Multilevel Elective Courses (Bloom''s Taxonomy)', 'Programme Elective courses are divided into: (1) Level 3 Courses: Focus on Bloom''s lower cognitive levels (Remember, Understand, Apply) and carry 3 credits; (2) Level 5 Courses: Focus on higher cognitive levels (Analyze, Evaluate) and carry 5 credits (3 PE credits + 2 additional credits), supported by an additional 3 hours of self-study per week (R 3.19, R 3.20).'),
('Level 5 Course Viva Voce Requirement', 'Continuous Internal Evaluation (CIE) for Level 5 courses includes a mandatory viva voce conducted by an external subject expert (a faculty member from another KTU-affiliated college). The viva is held during the last week of the semester (R 3.21).'),
('Level 5 Course Internal Mark Distribution', 'For Level 5 courses, there is only one internal exam. The internal mark distribution is: Attendance (5 marks), Internal Examination (15 marks), Analyze component (5 marks), Evaluate component (5 marks), and Viva Voce (10 marks) (R 3.21).'),
('Level 5 Course Bonus Credit Criteria', 'A registered student is awarded the 2 additional credits of a Level 5 course only if they achieve: (1) >=80% of total marks in the CIE component OR >=70% in the viva component, AND (2) secure a minimum grade of ''B'' when ESE and CIE marks are combined. If either condition is not met, the student is awarded only 3 credits (R 3.24).'),
('Level 5 Failure & Re-registration', 'Students who fail a Level 5 course or receive an ''FE'' grade are permitted to cancel the Level 5 course. They can then register for an alternative Level 3 course listed within the same elective basket and join the junior batches (R 3.37).'),
('Elective Course Enrolment Minimums', 'A minimum enrolment of 15 students is required to offer any Programme Elective (PE) or Open Elective (OE) course. This minimum does not apply if the total intake of the program is less than 15, or for Level 5 courses (R 3.25, R 3.26).'),
('Open Elective (OE) Registration Constraints', 'Students cannot register for an Open Elective course if there is more than a 30% syllabus overlap with their Major, Honours, or Minor courses. Students can register for an OE from their parent department only if the nomenclature is different and there is at least a 70% difference in syllabus content (R 3.27).'),
('Industry Linked Electives (ILE) Approval', 'ILE courses are designed in collaboration with industry. The Principal must submit a review report, MoU, and syllabus to the University at least 2 months prior to classes. Content must be reviewed by the Industry Linked BoS and approved by the Academic Council. Instructing faculty must be trained by the industry partner (R 3.31).'),
('Elective Course Changes and Restrictions', 'Students are prohibited from changing their registered PE and OE/ILE courses after completing exam registration on the KTU portal. Students with FE status in a PE course can change to an alternate elective only if their original elective is no longer offered, subject to university approval (R 3.34, R 3.35).'),
('Maximum Credit Registration Limit', 'The maximum number of credits a student can register for in any semester is limited to 15 credits in excess of the total mandatory credits allotted in the curriculum for that semester. This limit is waived for scheme migration and inter-university transfer students for transitory courses (R 3.42).'),
('Maximum Program Duration & Grace Period', 'The normal duration of the B.Tech program is 4 years. Students with backlog courses are allowed a maximum grace period of 2 years (total 6 years) to complete all credit requirements, after which registration is automatically cancelled without notification (R 4.1.i, R 4.1.ii).'),
('Senior Faculty Advisor (SFA) Advisory System', 'Each class is assigned a dedicated SFA with a minimum of 5 years of teaching experience. An SFA is restricted to overseeing only one class. FAs (Faculty Advisors) are assigned to guide groups of 25 to 35 students. The SFA/FA is responsible for regular communication with parents regarding academic progress (R 5.1).'),
('Student and Parent Request Protocol', 'Students and parents must submit all requests, applications, and academic queries to their respective SFA/FA. The SFA/FA reviews and recommends the requests, which are then forwarded by the Head of Department (HOD) to the Principal for final action (R 5.3).'),
('Class Committee Constitution', 'For every class, a class committee is formed consisting of: SFA (Chairperson), Faculty Advisors, a senior faculty member from another department, and a minimum of eight student representatives from all genders. The committee meets at least twice per semester: once within the first 2 weeks, and once after the first internal exam results (R 5.5).'),
('Class PTA Meetings', 'Each class must conduct a Parent-Teacher Association (PTA) meeting at least once per semester, scheduled after the first internal exam results are announced. Participants include the HOD, SFA, FAs, course faculty, and parents/guardians (R 5.5.iii).'),
('Internal Marks & Attendance Publication', 'Course-wise attendance, internal marks, and activity points must be displayed on the department notice board for at least two working days before they are uploaded to the University portal. Student concerns are addressed in class committee meetings (R 5.6.i).'),
('Branch Change Restriction', 'No student shall be permitted to change the branch of study or discipline to which they were admitted by the competent authority after the closure of the admission process (R 2.3).');

-- Academic Regulations (All 26 Sections)
INSERT INTO academic_regulations (category_number, category_name, rule_code, rule_title, rule_description) VALUES
(1, 'General', 'R 1.1', 'Academic Policies Scope', 'The provisions contained in these regulations govern the policies and procedures for admission, registration, course instruction, conduct of exams, evaluation, and B.Tech degree certification for affiliated colleges other than autonomous colleges.'),
(1, 'General', 'R 1.2', 'Regulations Modification', 'The University reserves the authority to modify the academic regulations from time to time based on academic council recommendations.'),
(2, 'Admission', 'R 2.3', 'Branch Change Restriction', 'No student shall be permitted to change their branch of study or discipline to which they were admitted after the closure of the admission process.'),
(2, 'Admission', 'R 2.4', 'Institute Transfer Restriction', 'A student admitted to a particular institute must continue their studies at that institute until completion, unless granted an inter-college transfer under Regulation R. 20.'),
(3, 'Structure of B. Tech. Programme', 'R 3.1', 'B.Tech Program Duration', 'The normal duration of the B.Tech program is 4 years divided into 8 semesters.'),
(3, 'Structure of B. Tech. Programme', 'R 3.2', 'Graduation Options', 'Students can graduate under four options: (1) B.Tech Major (170 Credits), (2) B.Tech with Minor (185 Credits), (3) B.Tech with Honours (185 Credits), or (4) B.Tech with Honours and Minor (200 Credits).'),
(3, 'Structure of B. Tech. Programme', 'R 3.3', 'Credit Relaxation Policy', 'Students who acquire at least 160 credits (157 academic + 3 activity credits) are eligible for the degree, allowing a shortfall of up to 10 credits. Seminar, Mini Project, and Major Project are excluded from this relaxation.'),
(3, 'Structure of B. Tech. Programme', 'R 3.5', 'Academic Semesters & Working Days', 'Each academic year includes an Odd, Even, and Summer semester. Each semester has a minimum of 90 working days, of which 65 must be instructional days. Rescheduling of lost days (including on Saturdays) is mandatory for declared holidays.'),
(3, 'Structure of B. Tech. Programme', 'R 3.14', 'Self-Study (SS) Hours', 'The Self-Study hours per week for each course are calculated as: SS Hours = 1.5 * Lecture (L) + 0.5 * T (Tutorial) + 0.5 * P (Practical) + R (Project/Practice).'),
(3, 'Structure of B. Tech. Programme', 'R 3.15', 'Course Category Credits Breakup', 'The 167 academic credits are distributed into HMC (9), BSC (20), ESC (29), PCC (52), PBL (16), PEC (18), OEC/ILE (9), PWS (12), HWP (1), and SEC (1) categories.'),
(3, 'Structure of B. Tech. Programme', 'R 3.20', 'Level 5 Elective Courses', 'Level 5 courses assess higher-order thinking (Analyze/Evaluate), carry 5 credits (3 PE + 2 bonus credits), and require a viva voce with an external subject expert.'),
(3, 'Structure of B. Tech. Programme', 'R 3.24', 'Level 5 Bonus Credit Requirements', 'To earn the 2 bonus credits for a Level 5 course, a student must secure >=80% in CIE or >=70% in the viva, and obtain a combined ESE+CIE grade of ''B'' or above. Otherwise, only 3 credits are awarded.'),
(3, 'Structure of B. Tech. Programme', 'R 3.27', 'Open Elective (OE) Overlap Rules', 'Students are prohibited from registering for Open Elective courses with more than 30% syllabus overlap with Major/Honours/Minor courses. Parent department OEs must have at least 70% content difference.'),
(3, 'Structure of B. Tech. Programme', 'R 3.31', 'Industry Linked Electives (ILE)', 'ILE courses are designed with industry partners. The College Principal must submit a review report, MoU, and syllabus to the university 2 months prior to classes. Instructing faculty must be trained by the industry.'),
(3, 'Structure of B. Tech. Programme', 'R 3.42', 'Semester Credit Registration Limit', 'Maximum semester credit registration is limited to 15 credits in excess of mandatory semester credits. Waived for scheme migration and inter-university transfer transitory courses.'),
(4, 'Maximum Duration for the Completion of B. Tech. Programme', 'R 4.1', 'Grace Period & Cancellation', 'Students are permitted an additional grace period of 2 years (total 6 years) to complete all backlog courses, after which registration is automatically cancelled without notification.'),
(5, 'Academic Mentoring and Student Support', 'R 5.1', 'Advisory System (SFA/FA)', 'Each class is assigned a Senior Faculty Advisor (SFA) with >=5 years experience. Faculty Advisors (FA) are assigned to guide groups of 25 to 35 students.'),
(5, 'Academic Mentoring and Student Support', 'R 5.3', 'Request & Communication Protocol', 'All student/parent requests must be reviewed and recommended by the SFA/FA, and then forwarded by the HOD to the Principal for final action.'),
(5, 'Academic Mentoring and Student Support', 'R 5.5', 'Class Committee & PTA Meetings', 'Class committees (SFA, FAs, external faculty, student reps) must meet twice a semester. Class PTA meetings must be conducted at least once per semester after the first internal exam results.'),
(5, 'Academic Mentoring and Student Support', 'R 5.6', 'Marks & Attendance Display', 'Attendance and internal marks must be displayed on the notice board for at least 2 working days before being uploaded to the university portal.'),
(6, 'Attendance', 'R 6.1', 'Minimum Attendance & Leave', 'Minimum 75% attendance is mandatory to appear for ESE. Relaxed by 2% (to 73%) for menstrual leave, and by 5% (to 70%) for students with disabilities (PWD).'),
(6, 'Attendance', 'R 6.2', 'Attendance Condonation Limit', 'Attendance between 60% and 74.9% can be condoned by the Principal under exceptional/medical grounds for a maximum of 2 semesters during the program, subject to fee payment.'),
(6, 'Attendance', 'R 6.3', 'Duty Leave Limit', 'Principals can grant attendance relaxation (duty leave) up to a maximum of 10% for representing the college/zone in officially sponsored events, submitted within 10 days.'),
(7, 'Assessment', 'R 7.1', 'CIE and ESE Weightage', 'Theory courses are assessed via 40% Continuous Internal Evaluation (CIE) and 60% End Semester Examination (ESE).'),
(7, 'Assessment', 'R 7.2', 'Passing Minimums', 'To pass a course, a student must secure a minimum of 40% in ESE and 40% combined (CIE+ESE).'),
(7, 'Assessment', 'R 7.3', 'Grading Scale', 'A 10-point letter grade system is used: S (10), A+ (9), A (8.5), B+ (8), B (7), C (6), P (5.5), F (0), FE (0 - fail due to eligibility), I (Incomplete).'),
(8, 'Challenge Courses', 'R 8.1', 'Fast-Track Credits', 'Exceptionally bright students with CGPA >= 8.5 and no backlogs can earn credits for specific courses by taking direct examinations without class attendance.'),
(9, 'Calculation of SGPA/CGPA', 'R 9.1', 'SGPA Formula', 'SGPA = Sum(Course Credits * Grade Points) / Sum(Course Credits) obtained in that semester.'),
(9, 'Calculation of SGPA/CGPA', 'R 9.2', 'CGPA Formula', 'CGPA = Sum(Course Credits * Grade Points) / Sum(Course Credits) across all semesters completed.'),
(10, 'Activity Credits Requirement for B. Tech. Students', 'R 10.1', 'Mandatory Activity Points', 'Students must earn a minimum of 120 activity points (min 40 points from each of three defined groups) to claim the 3 mandatory student activity credits.'),
(11, 'Eligibility for B. Tech. Degree', 'R 11.1', 'Degree Award Requirements', 'Degrees are awarded to students who acquire 170 credits (or 160 under relaxation), clear all fees/dues, and have no pending disciplinary actions.'),
(12, 'Break of Study', 'R 12.1', 'Approved Break Duration', 'A student can take a break of study for up to 2 semesters on valid medical grounds or for entrepreneurial ventures, subject to prior university approval.'),
(13, 'Uninformed Long Absence', 'R 13.1', 'Rolls Removal & Re-admission', 'Uninformed absence for more than 15 consecutive working days results in removal from rolls. Re-admission is subject to Principal''s approval and fee payment.'),
(14, 'Scheme Migration', 'R 14.1', 'Curriculum Migration', 'Students returning from a break of study or repeating a semester must migrate to the 2024 scheme and complete transitory courses identified by the Board of Studies.'),
(15, 'Minor in Engineering', 'R 15.1', 'Types of Minors', 'B.Tech Minor is an extension of B.Tech degree allowing students to study outside their major discipline. Minors are offered in specialized areas, on a branch-wise basis, or as Industry-Linked Minors (ILM). Minors can be offered by a single department or in collaboration with two or more departments, approved by the BoS and Academic Council.'),
(15, 'Minor in Engineering', 'R 15.2', 'Industry Linked Minors (ILM)', 'ILM syllabi are designed in collaboration with industry partners/Govt agencies. Industry plays a key role in designing content, delivering courses, and assessment. Affiliated colleges can subscribe to approved ILMs if they meet prerequisites. Assigned faculty must receive industry training. For common courses across colleges, the university provides ESE question papers. Answer script valuation is done at the college level.'),
(15, 'Minor in Engineering', 'R 15.3', 'Registration for Minor', 'All B.Tech students are eligible to register. Registration is permitted at the beginning of the 3rd semester. A student can opt for only one minor specialization, which cannot be changed later. A minimum enrolment of 15 students is required to offer a minor programme.'),
(15, 'Minor in Engineering', 'R 15.4', 'Minor Registration Restrictions', 'Students are generally not allowed to register for minors offered by their parent branches. They are prohibited from opting for minor courses if there is more than 30% syllabus content overlap between the major and minor programmes.'),
(15, 'Minor in Engineering', 'R 15.5', 'Parent Department Exceptions', 'In exceptional cases, students may select a minor offered by their parent department if: (1) The course nomenclature differs significantly from courses in their Major and Honours programs, and (2) There is at least a 70% difference in syllabus content compared to courses in their Major and Honours programmes.'),
(15, 'Minor in Engineering', 'R 15.6', 'Eligible Branches for Minors', 'The Board of Studies (BoS) shall publish the details of student branches eligible to opt for a Minor programme offered by a department or departments.'),
(15, 'Minor in Engineering', 'R 15.7', 'Minor Selection Verification', 'A scrutiny committee (SFAs, KTU Coordinator, HODs, IQAC Convenor, UG Dean) verifies that the minor selected by students complies with guidelines R 15.3 to R 15.6. The College Council then verifies and approves the final list. Minutes must be available for external auditors upon request.'),
(15, 'Minor in Engineering', 'R 15.8', 'Minor Credit Requirement & Semester Distribution', 'The student must earn an additional 15 credits to get a B.Tech with Minor. The minor courses and credits are structured across four semesters: Semester 3: 4 Credits; Semester 4: 4 Credits; Semester 5: 4 Credits; Semester 6: 3 Credits.'),
(15, 'Minor in Engineering', 'R 15.9', 'Minor Course and Credit Mix', 'Out of the 15 minor credits, 7 to 8 credits must be earned by completing a minimum of two theory courses listed in the minor curriculum. The remaining credits can be acquired by: (1) completing 2 MOOCs recommended by BoS and approved by Academic Council, (2) completing other theory courses listed in the minor curriculum, or (3) a combination of MOOC and theory courses.'),
(15, 'Minor in Engineering', 'R 15.10', 'Minor MOOC Minimum Duration', 'The MOOC course taken towards minor credit fulfillment must have a minimum duration of 8 weeks.'),
(15, 'Minor in Engineering', 'R 15.11', 'Minor Assessment & MOOC Certification', 'Regular minor courses are assessed as per regular evaluation regulations. MOOC assessment and certification adhere to the norms of the respective platforms. Candidates must present the certificate issued by the MOOC agency as proof within the normal programme duration.'),
(15, 'Minor in Engineering', 'R 15.12', 'Minor Exams, Revaluation, and Failures', 'Registration for S3 and S4 Minor theory courses is mandatory. If MOOCs are not chosen, higher semester theory registration is also mandatory. Revaluation is permitted for all Minor theory courses. There are NO supplementary examinations for minor theory courses. If a student fails a minor theory course, they can register for an alternate MOOC. Students must pass a minimum of two minor theory courses to qualify. Absence from ESE or failing to meet minimum attendance results in an ''F'' grade (not ''FE'' grade).'),
(15, 'Minor in Engineering', 'R 15.13', 'Completion Requirement & CGPA Rules', 'The Minor will not be awarded if the student fails to acquire the mandatory 15 credits within the standard 4-year duration. If the student does not qualify, the completed minor course credits will be shown in the Consolidated Grade Card but will be excluded from SGPA and CGPA calculations.'),
(15, 'Minor in Engineering', 'R 15.14', 'Minor Grace Marks Ban', 'Grace Marks shall not be awarded for Minor courses under any circumstances.'),
(15, 'Minor in Engineering', 'R 15.15', 'SGPA/CGPA Calculation Exclusion', 'The additional credits earned for B.Tech Minor courses shall not be considered for calculating the student''s SGPA or CGPA.'),
(15, 'Minor in Engineering', 'R 15.16', 'Minor Credit Transfer Rules', 'Credits earned in the Minor programme are not transferable to the regular B.Tech programme, and credits from the regular B.Tech programme cannot be transferred to the Minor programme.'),
(15, 'Minor in Engineering', 'R 15.17', 'Minor Degree Nomenclature', 'Upon completion of the programme, students will be awarded a degree stating ''Bachelor of Technology in [Major] with Minor in [Minor].'' The consolidated grade card will list the specific minor courses taken.'),
(16, 'B. Tech. (Honours)', 'R 16.1', 'Honours Eligibility & Registration', 'B.Tech (Honours) allows students to undertake additional courses within their own discipline. All B.Tech students are eligible to register. Honours registration is along with the registration of the 4th semester. To qualify, students must achieve a CGPA of 8.0 or higher at the end of the eighth semester and meet all academic requirements.'),
(16, 'B. Tech. (Honours)', 'R 16.2', 'Honours Credit Requirement & Semester Distribution', 'The student must earn an additional 15 credits to qualify for Honours. The credits are structured across four semesters: Semester 4: 4 Credits; Semester 5: 4 Credits; Semester 6: 4 Credits; Semester 7: 3 Credits.'),
(16, 'B. Tech. (Honours)', 'R 16.3', 'Honours Course and Credit Mix', 'Out of the 15 credits, 4 credits must be earned by completing the first theory course listed in the Honours curriculum. The remaining 11 credits can be acquired by: (1) completing BoS-recommended/Academic Council-approved MOOCs, (2) completing other Honours theory courses, (3) a combination of MOOCs and theory courses, (4) additional credits (2 credits per course) from Level 5 elective courses completed successfully, or (5) a combination of MOOCs, theory courses, and Level 5 elective credits.'),
(16, 'B. Tech. (Honours)', 'R 16.4', 'Honours MOOC Minimum Duration', 'The MOOC course taken towards Honours credit fulfillment must have a minimum duration of 8 weeks.'),
(16, 'B. Tech. (Honours)', 'R 16.5', 'Honours Assessment & MOOC Certification', 'Regular Honours courses are assessed per standard guidelines. MOOC assessment adheres to platform norms. Candidates must present the certificate from the MOOC agency as proof of credit attainment, submitted within the normal program duration.'),
(16, 'B. Tech. (Honours)', 'R 16.6', 'Honours Exams, Revaluation, and Absence', 'Registration for the S4 Honours theory course is mandatory. If MOOCs are not chosen, higher semester theory course registration is also mandatory. Revaluation is permitted. There are NO supplementary examinations for Honours theory courses. Absence from ESE or failing to meet minimum attendance results in an ''F'' grade (not ''FE'' grade).'),
(16, 'B. Tech. (Honours)', 'R 16.7', 'Disqualification on Failure', 'If a student fails in any course, including the course chosen for B.Tech (Honours), at any time during semesters 1 to 8, they shall not be eligible to continue or receive the B.Tech (Honours) degree.'),
(16, 'B. Tech. (Honours)', 'R 16.8', 'Conferment Conditions for B.Tech Honours', 'The ''Bachelor of Technology (Honours) in [Major]'' is conferred only if: (1) CGPA at the end of the 8th semester is >= 8.0, (2) student earns a grade of ''C'' or above in the S4 Honours course and obtains the remaining 11 credits, (3) there is NO record of ''F'' or ''FE'' grades in the Honours and Major courses from Semesters 1 to 8, and (4) all requirements are completed within the normal 4-year duration.'),
(16, 'B. Tech. (Honours)', 'R 16.9', 'Honours Grace Marks Ban', 'Grace Marks shall not be awarded for Honours courses under any circumstances.'),
(16, 'B. Tech. (Honours)', 'R 16.10', 'Honours Non-eligibility & Credit Rules', 'If a student fails to qualify for Honours, completed Honours credits are shown on the Consolidated Grade Card but excluded from SGPA/CGPA calculations, unless used under Regulation R 3.4 (Credit Consideration) to fulfill basic B.Tech degree requirements.'),
(16, 'B. Tech. (Honours)', 'R 16.11', 'Honours and Minor Combined Award', 'A student who successfully completes eligibility requirements for both Honours and Minor will be awarded a degree stating: ''Bachelor of Technology (Honours) in [Major] with Minor in [Minor].'''),
(17, 'Massive Open Online Course (MOOC)', 'R 17.1', 'MOOC Credit Transfer', 'Students can transfer credits earned from approved online platforms (e.g. NPTEL/SWAYAM) for electives, minors, or honours, subject to BoS approval.'),
(18, 'Grace Marks for Sports /Arts Competitions', 'R 18.1', 'Co-curricular Grace Marks', 'Grace marks are awarded to students representing the university or state in recognized sports or arts events, up to a specified maximum (e.g. 5% to 10% in ESE).'),
(19, 'Grace Marks for Persons with Disability (PWD)', 'R 19.1', 'PWD Examination Support', 'PWD students are eligible for grace marks (up to 25% of pass minimum in ESE), extra time, and scribes during university examinations.'),
(20, 'Inter College Transfer', 'R 20.1', 'College Transfer Eligibility', 'Permitted at the beginning of the 3rd semester, subject to vacant seats, matching branch of study, and minimum CGPA criteria in the transferring colleges.'),
(21, 'Migration from other Universities', 'R 21.1', 'Inter-University Transfer', 'Permitted at the beginning of the 3rd or 5th semester. Course equivalence is determined by the Board of Studies and deficiencies must be cleared.'),
(22, 'Student Exchange Programme', 'R 22.1', 'Exchange Semester Credits', 'Students can spend one semester at a premier national/international institute with an MoU with KTU. Credits earned there will be transferred to KTU.'),
(23, 'Internships', 'R 23.1', 'Mandatory Internship Duration', 'Students must complete a mandatory internship of minimum 15 days in industries or research labs, typically during the summer semesters.'),
(24, 'Industrial Visit', 'R 24.1', 'Mandatory Field Visit', 'Every student must participate in at least one industrial visit organized by their department during the course of the B.Tech program.'),
(25, 'Ombudsperson', 'R 25.1', 'Grievance Redressal', 'An Ombudsperson is appointed at the university level to resolve student grievances related to examinations or administration not settled at the college level.'),
(26, 'Overriding Provisions.', 'R 26.1', 'KTU Act Precedence', 'In the event of any conflict in interpretation of these regulations, the provisions in the APJ Abdul Kalam Technological University Act, 2015 shall prevail.');

-- Minor Curriculum Courses
INSERT INTO minor_curriculum_courses (semester, course_code_pattern, credits, hours_per_week, lecture_structure, self_study_hours, cia_marks, ese_marks, description) VALUES
(3, 'MNXXT309', 4, '4 or 5', '3-1-0 or 3-0-2', 5.0, 40, 60, 'Course or MOOC. Can be structured as either a pure theory-based course (3-1-0) or a combination of theory and lab-based course (3-0-2). Mandatory registration in S3.'),
(4, 'MNXXT409', 4, '4 or 5', '3-1-0 or 3-0-2', 5.0, 40, 60, 'Course or MOOC. Can be structured as either a pure theory-based course (3-1-0) or a combination of theory and lab-based course (3-0-2). Mandatory registration in S4.'),
(5, 'MNXXT509', 4, '4', '3-1-0', 5.0, 40, 60, 'Course or MOOC. Pure theory-based course structure (3-1-0) with 5 self-study hours per week.'),
(6, 'MNXXT609', 3, '3', '3-0-0', 4.5, 40, 60, 'Course or MOOC. Pure theory-based course structure (3-0-0) with 4.5 self-study hours per week.');

-- Specialized Minor Domains
INSERT INTO specialized_minor_domains (domain_name, description) VALUES
('Data Science', 'Focuses on statistical modeling, data visualization, and advanced analytics.'),
('Artificial Intelligence (AI)', 'Covers machine learning algorithms, deep learning, NLP, and computer vision.'),
('Robotics', 'Specializes in robot kinematics, control systems, and automation.'),
('Internet of Things (IoT)', 'Covers embedded systems, sensor networks, and IoT architecture.'),
('AI and IoT', 'Interdisciplinary domain combining artificial intelligence techniques with IoT data and systems.'),
('Robotics and AI', 'Focuses on intelligent robot systems, autonomous navigation, and machine vision in robotics.'),
('Entrepreneurship', 'Provides training in business models, venture creation, product-market fit, and funding.'),
('Electric Vehicle Technology', 'Covers EV drivetrains, battery management, power electronics, and motor control.'),
('Supply Chain and Logistics Management', 'Focuses on operations, procurement, distribution, and warehouse management.');

-- Honours Curriculum Courses
INSERT INTO honours_curriculum_courses (semester, course_code_pattern, credits, hours_per_week, lecture_structure, self_study_hours, cia_marks, ese_marks, description) VALUES
(4, 'HNXXT409', 4, '4', '3-1-0', 5.0, 40, 60, 'Mandatory first theory course in B.Tech Honours curriculum. Must secure a grade of ''C'' or above to qualify for Honours.'),
(5, 'HNXXT509', 4, '4', '3-1-0', 5.0, 40, 60, 'Course or MOOC. Structured with 4 contact hours and 5 self-study hours per week.'),
(6, 'HNXXT609', 4, '4', '3-1-0', 5.0, 40, 60, 'Course or MOOC. Structured with 4 contact hours and 5 self-study hours per week.'),
(7, 'HNXXT709', 3, '3', '3-0-0', 4.5, 40, 60, 'Course or MOOC. Pure theory course structure (3-0-0) with 3 contact hours and 4.5 self-study hours.');
