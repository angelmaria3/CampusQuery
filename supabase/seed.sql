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

-- ==========================================
-- Insert Seed Data (Realistic Mock Content)
-- ==========================================

-- Attendance Rules
INSERT INTO attendance_rules (gender, min_percentage, description) VALUES
('All', 75, 'A minimum of 75% attendance is required to qualify for writing semester examinations. Students falling between 65% and 75% must apply for condonation on valid grounds.'),
('Medical Cases', 65, 'Students with serious medical issues can be granted eligibility down to 65% attendance, subject to producing verified medical certificates and paying the condonation fee.');

-- Exam Registration & Fees
INSERT INTO exam_registration_fees (exam_name, registration_deadline, fee_amount, late_fee_amount) VALUES
('Regular Semester Exams (Nov/Dec 2026)', 'November 15, 2026', 1800.00, 500.00),
('Supplementary Exams (Nov/Dec 2026)', 'November 20, 2026', 1000.00, 300.00),
('Practical & Lab Assessments (Oct 2026)', 'October 30, 2026', 500.00, 150.00);

-- Events
INSERT INTO events (event_name, event_date, venue) VALUES
('Anokha TechFest 2026', 'October 12-14, 2026', 'Main Campus Auditorium & Lab Blocks'),
('Spardha Annual Sports Meet', 'November 3-5, 2026', 'Campus Main Playground & Stadium'),
('ByteCraft Hackathon', 'September 20-21, 2026', 'CSE Research & Innovation Lab');

-- Department Info
INSERT INTO department_info (department_name, hod_name, description) VALUES
('Computer Science & Engineering', 'Dr. Alice Vance', 'Focuses on software development, AI, cyber security, and data structures. Office is in Block-A, First Floor.'),
('Mechanical Engineering', 'Dr. Bob Miller', 'Specializes in thermodynamics, robotics, machine design, and material science. Office is in Block-B, Ground Floor.'),
('Electrical & Electronics Engineering', 'Dr. Carol Smith', 'Focuses on power grids, microprocessors, and control systems. Office is in Block-C, Second Floor.');

-- Condonation Rules
INSERT INTO condonation_rules (eligibility, procedure, fee_amount) VALUES
('Attendance must be between 65% and 74.9% with a valid reason (medical issues or official representations).', 'Submit an application through your respective HOD along with verified medical certificates (or official OD documents) to the academic registrar office before the deadline.', 750.00);

-- Exam Rules
INSERT INTO exam_rules (rule_title, rule_description) VALUES
('Hall Ticket', 'It is mandatory to carry a printed hall ticket and a valid college ID card to the exam hall. No digital copies are allowed.'),
('Electronic Devices', 'Mobile phones, smartwatches, fitbits, and programmable calculators are strictly prohibited inside the exam hall. Possession of these will be treated as malpractice.'),
('Reporting Time', 'Students must occupy their designated seats 15 minutes before the exam starts. No student will be allowed to enter the hall after 30 minutes from the commencement of the exam.');
