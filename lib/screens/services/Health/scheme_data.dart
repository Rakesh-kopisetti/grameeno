import 'package:flutter/material.dart';

final List<Map<String, dynamic>> healthSchemes = [
  {
    "schemeName": "NTR Arogya Raksha Scheme (AP)",
    "icon":Icons.local_hospital,
    "description": "NTR Arogya Raksha is the flagship health insurance program of Andhra Pradesh. It covers up to ₹5 lakh per family per year for treatment of serious illnesses, with a nominal annual premium for Above Poverty Line (APL) families. Launched in 2017 and administered by Dr NTR Vaidya Seva Trust, it covers over 1,044 diseases and provides cashless treatment in hundreds of empanelled hospitals across the state. The goal is to ensure financial protection and universal health access, especially for vulnerable rural communities. :contentReference[oaicite:1]{index=1}",
    "keyBenefits": [
      "Up to ₹5 lakh coverage per family per year",
      "Covers 1,044+ critical illness procedures",
      "Cashless treatment at empanelled public & private hospitals",
      "Affordable annual premium for APL families"
    ],
    "eligibility": [
      "Resident of Andhra Pradesh",
      "Above Poverty Line (APL) families",
      "Eligible under state-defined criteria"
    ],
    "howToAvail": [
      "Enroll through official Aarogyasri portal or Dr NTR Vaidya Seva Trust",
      "Present health card at empanelled hospital",
      "Verification and approval by hospital administrator",
      "Receive cashless treatment"
    ],
    "documentsRequired": [
      "Aadhaar Card",
      "Family ID or Income certificate",
      "APL card (if available)"
    ],
    "whereToApply": "Dr NTR Vaidya Seva Trust facilities or empanelled hospitals",
    "applyLink": "https://aarogyasri.ap.gov.in"
  },
  {
    "schemeName": "AP Rural Clinics Scheme",
    "icon":Icons.medical_services,
    "description": "Launched in 2022, YSR Rural Clinics bring primary healthcare to the doorstep of villagers in Andhra Pradesh. About 10,000 clinics will be attached to village secretariats, each serving ~2,000 residents. Staff includes mid-level health providers, ANMs and ASHAs. Services include 12 basic medical services, 14 diagnostic tests, 64 essential medicines and tele‑medicine linked to PHCs and labs via Arogyasri cards.  :contentReference[oaicite:2]{index=2}",
    "keyBenefits": [
      "Free primary checkups in the village",
      "Basic diagnostic services on site",
      "Medicine distribution & telemedicine support",
      "Health records stored and accessible via Arogyasri card"
    ],
    "eligibility": [
      "Residents of villages where clinics are operational",
      "Linked via Arogyasri QR code health records"
    ],
    "howToAvail": [
      "Visit the designated village clinic",
      "Provide Arogyasri card or ID",
      "Undergo examination and diagnostics",
      "Receive medication or referral via tele-consult"
    ],
    "documentsRequired": [
      "Arogyasri Card with QR code or Aadhaar",
      "Village ID or address proof"
    ],
    "whereToApply": "YSR Rural Clinics attached to village secretariats",
    "applyLink": "https://hmfw.ap.gov.in" /* Program portal */
  },
  {
    "schemeName": "Bangaru Thalli Scheme",
    "icon":Icons.child_friendly,
    "description": "Bangaru Thalli is a unique welfare program in Andhra Pradesh supporting the birth, education, and empowerment of girl children in BPL households. From the prenatal stage to college graduation, beneficiaries receive periodic cash benefits—e.g., ₹1,000 monthly during pregnancy, ₹2,500 at birth, and increasing annual amounts through schooling and higher education. Designed to tackle gender inequality and boost educational attainment and female empowerment. :contentReference[oaicite:3]{index=3}",
    "keyBenefits": [
      "Monthly ₹1,000 during pregnancy",
      "₹2,500 at birth of girl child",
      "Annual support through schooling and college",
      "Incentives up to ₹1 lakh on degree completion"
    ],
    "eligibility": [
      "Girl child born after 1 May 2013",
      "Family holds BPL white ration card",
      "Resident of Andhra Pradesh"
    ],
    "howToAvail": [
      "Register via Anganwadi or SERP/MEPMA office",
      "Provide birth details and ration card proof",
      "Automatic disbursal via bank transfer at milestone stages"
    ],
    "documentsRequired": [
      "White Ration Card",
      "Birth Certificate of child",
      "Bank account linked to Aadhaar"
    ],
    "whereToApply": "Anganwadi Centre / SERP (rural) or MEPMA (urban)",
    "applyLink": "https://womenandchild.ap.gov.in"
  },
  {
    "schemeName": "Integrated Child Development Services",
    "icon":Icons.family_restroom,
    "description": "ICDS is a national program focused on improving nutrition, health, and education of children under six years and their mothers. Through Anganwadi centers, ICDS provides preschool education, immunization drives, health checkups, supplemental nutrition, and referrals to health services. It plays a critical role in reducing infant mortality, malnutrition, and promoting early childhood development across India. :contentReference[oaicite:4]{index=4}",
    "keyBenefits": [
      "Supplementary nutrition to children & pregnant women",
      "Preschool education & immunization",
      "Routine health checkups and referral services",
      "Anganwadi-based growth monitoring"
    ],
    "eligibility": [
      "Children under 6 years and pregnant/lactating women",
      "Resident in areas served by Anganwadi Centres"
    ],
    "howToAvail": [
      "Visit nearest Anganwadi centre",
      "Register child or mother with worker",
      "Receive periodic nutrition, immunization, and checks"
    ],
    "documentsRequired": [
      "Mother’s/child’s Aadhaar or birth record",
      "Proof of residence"
    ],
    "whereToApply": "Local Anganwadi Centres (ICDS network)",
    "applyLink": "https://www.icds-wcd.nic.in"
  },
  {
    "schemeName": "Ayushman Bharat – PM‑JAY",
    "icon":Icons.health_and_safety,
    "description": "Ayushman Bharat – Pradhan Mantri Jan Arogya Yojana (PM‑JAY) is India’s flagship health protection mission that provides cashless hospitalization coverage of ₹5 lakh per eligible family annually. It covers secondary and tertiary healthcare including surgeries, diagnostics and inpatient care across empanelled hospitals. Aimed at reducing out‑of‑pocket health expenditure for poor and vulnerable families across India. :contentReference[oaicite:5]{index=5}",
    "keyBenefits": [
      "₹5 lakh annual coverage per family",
      "Covers over 1,350 medical procedures",
      "Cashless treatment at public & private hospitals",
      "Nationwide portability"
    ],
    "eligibility": [
      "Listed under SECC (Socio-Economic Caste Census)",
      "Residency in India",
      "No specific income or age restrictions"
    ],
    "howToAvail": [
      "Check eligibility on PM‑JAY portal or CSC",
      "Get registered and issued e-card",
      "Go to empanelled hospital with e‑card and Aadhaar",
      "Receive cashless treatment"
    ],
    "documentsRequired": [
      "Aadhaar Card",
      "Ration Card or Family ID",
      "PM‑JAY e‑Card"
    ],
    "whereToApply": "Nearest CSC centre or empanelled hospital",
    "applyLink": "https://pmjay.gov.in"
  },
  {
    "schemeName": "National TB Elimination Program",
    "icon":Icons.coronavirus,
    "description": "Launched under the auspices of the National Health Mission, NTEP (formerly RNTCP) aims to detect and treat TB across India with unified efforts to end tuberculosis by 2025. It offers free sputum/X-ray diagnostics, free full-course DOTS treatment, nutritional support, contact tracing and community-based counselling. A robust public health effort to reduce TB burden and prevent transmission across all strata. :contentReference[oaicite:6]{index=6}",
    "keyBenefits": [
      "Free TB tests and diagnosis",
      "DOTS-based full treatment",
      "₹500/month nutritional support",
      "Community follow-up and contact tracing"
    ],
    "eligibility": [
      "Any individual with symptoms like cough >2 weeks, fever, weight loss",
      "All age groups"
    ],
    "howToAvail": [
      "Visit nearest government hospital or PHC with symptoms",
      "Undergo sputum/X-ray testing",
      "Enroll for DOTS if positive",
      "Regular monthly medication and checkup"
    ],
    "documentsRequired": [
      "Aadhaar Card or ID proof",
      "Test results (sputum / X-ray)",
      "Treatment register (provided at registration)"
    ],
    "whereToApply": "Public Health Centres / Government TB Units",
    "applyLink": "https://tbcindia.gov.in"
  }
];
