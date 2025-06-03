final Map<String, List<String>> departmentCourses = {
  'CSE': [
    'Web Engineering',
    'Structured Programming',
    'Data Structures',
    'Artificial Intelligence',
    'Cloud Computing',
    // ... Add all CSE courses
  ],
  'EEE': [
    'Electrical Circuits I',
    'Power Electronics',
    'Digital Communication',
    // ... Add all EEE courses
  ],
  'BBA': [
    'Principles of Management',
    'Business Law',
    'Marketing Management',
    // ... Add all BBA courses
  ],
  'LLB': [
    'Legal Method',
    'Law of Contract',
    // ... Add all LLB courses
  ],
  'ENGLISH': [
    'Introduction to Literature',
    // ... Add all ENGLISH courses
  ],
  'CIVIL': [
    'Engineering Mechanics',
    // ... Add all CIVIL courses
  ],
  'PHARMACY': [
    'Pharmaceutical Chemistry I',
    // ... Add all PHARMACY courses
  ],
  'ARCHITECTURE': [
    'Architectural Design Studio I',
    'Basic Design',
    // ... Add all ARCHITECTURE courses
  ],
  'JOURNALISM': [
    'Introduction to Journalism',
    // ... Add all JOURNALISM courses
  ],
};

String getPdfUrl(String department, String course) {
  if (department == 'CSE' && course == 'Data Structures') {
    return 'https://drive.google.com/drive/folders/1bExyf-QoJ7PX-mj4UHcPOCAgE1w0lWGN?usp=drive_link';
  }
  if (department == 'EEE' && course == 'Electrical Circuits I') {
    return 'https://www.tutorialspoint.com/...';
  }
  if (department == 'BBA' && course == 'Business Law') {
    return 'https://drive.google.com/...';
  }
  if (department == 'PHARMACY' && course == 'Pharmaceutical Chemistry I') {
    return 'https://pharmacy.unc.edu/...';
  }
  if (department == 'ARCHITECTURE' && course == 'Basic Design') {
    return 'https://drive.google.com/...';
  }
  if (department == 'JOURNALISM' && course == 'Introduction to Journalism') {
    return 'https://www.routledgehandbooks.com/...';
  }

  return 'https://www.example.com/not-found.pdf'; // fallback
}
