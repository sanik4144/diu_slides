final Map<String, List<String>> departmentCourses = {
  'CSE': [
    'Web Engineering',
    
    'Data Structures',
    'Artificial Intelligence',
    
    'Embedded Systems and IoT',
    'Object-Oriented Programming',
    
    'Algorithms',
    'Discrete Mathematics',
    'Software Engineering',
    
    'Database Management Systems',
    'Operating Systems',
    'Computer Networks',
    
    'Compiler Design',
    
    'Computer Architecture and Organization',
    'Data Mining and Machine Learning',
    'Mobile Application Development',
    'Natural Language Processing',
    'Research and Innovation in CSE',
    'Software Project III',
    'Introduction to Data Science',
    'Object Oriented Programming II',
    'Digital Electronics',
    'Financial and Managerial Accounting',
    'System Analysis & Design',
    'Economics',
    'Software Project II',
    'Software Project I',
    'Engineering Mathematics',
    'Basic Electronics',
    'Data Communication',
    'Basic Electronics Lab',
    'History of Bangladesh and Bangla Language',
    'Bangladesh Studies',
    'Electrical Circuits',
    'Art of Living',
    'Programming and Problem Solving',
    'Business Application Design and Employability',
    'Mathematics-II: Calculus, Complex Variables & Linear Algebra',
    'Writing and Comprehension',
    'Basic Functional English and English Spoken',
    'Computer Fundamentals',
    'Statistics and Probability',
    'Numerical Methods',
    'Intro to Biology and Chemistry for Computation',
    'Basic Physics',
    'Basic Mathematics',
    'Basic Physics Lab',
    'Electrical Circuits Lab',
    'Object Oriented Programming Lab',
    'Principles Of Robotics',
    'Social and Professional Issues in Computing',

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



  // for cse
  if (department == 'CSE' && course == 'Data Structures') {
    return 'https://drive.google.com/drive/folders/1bExyf-QoJ7PX-mj4UHcPOCAgE1w0lWGN?usp=drive_link';
  }
  if (department == 'CSE' && course == 'Web Engineering') {
      return 'https://drive.google.com/drive/folders/16sv--q5bQeMvhOmI76V2cVC9ra1PhEr3';
    }
    if (department == 'CSE' && course == 'Embedded Systems and IoT') {
      return 'https://drive.google.com/drive/folders/1Qkps6RhFFI5hOWSObA6FR6Mwmccv0Zut?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Object-Oriented Programming') {
      return 'https://drive.google.com/drive/folders/19HVz6DT3JJUGMhKSiGaG3E5BugNGXfps?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Algorithms') {
      return 'https://drive.google.com/drive/folders/1zVwNUGCkbjZkeS-0-Pt10IWru-Rv_qBV?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Software Engineering') {
      return 'https://drive.google.com/drive/folders/1gvonMWcrtwY6t1V4FyTxj6fq1WDNYs79?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Computer Architecture and Organization') {
      return 'https://drive.google.com/drive/folders/1mmKwnFfRlqDLQKVBRdl746FMCldqiK3A?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Database Management Systems') {
      return 'https://drive.google.com/drive/folders/1tewxxTuhsXE0wB6zmcnbXMRlSYtN3d-g?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Operating Systems') {
      return 'https://drive.google.com/drive/folders/1uBwudEsVYf_ZuSxQQNNDpLzzwjAnKvA4?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Computer Networks') {
      return 'https://drive.google.com/drive/folders/1NgamM3WfkDTf9y4xrJ9YKqdmfmkUYXJt?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Artificial Intelligence') {
      return 'https://drive.google.com/drive/folders/1EqCFGENcvC2lehlG_Mh9pRtyWWddb4NY?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Compiler Design') {
      return 'https://drive.google.com/drive/folders/1WE3cioNhb08qxFDN7vIpcVi8A1jgXyW0?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Data Mining and Machine Learning') {
      return 'https://drive.google.com/drive/folders/1mWne43zGh0IXRjGAK1eHlj0MEIzq9YXp?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Mobile Application Development') {
      return 'https://drive.google.com/drive/folders/19o-GU6BcnMDl7d-_R7QTUTtk9AS4Butv?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Natural Language Processing') {
      return 'https://drive.google.com/drive/folders/1Dl-HV3XT0VO2jS86oZykZ2nd_BXxH0TS?usp=drive_link';
    }
    
    if (department == 'CSE' && course == 'Research and Innovation in CSE') {
      return 'https://drive.google.com/drive/folders/1Fbtuu-hhGWZ78CEsqfQIIkVDkyHb5A5R?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Software Project III') {
      return 'https://drive.google.com/drive/folders/15r18Ndo-ZfpLV5YWXUnu5pOmBebEK0-b?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Introduction to Data Science') {
      return 'https://drive.google.com/drive/folders/11qu26XYBVTIOas2-ErTp_yOUMhJqeivB?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Object Oriented Programming II') {
      return 'https://drive.google.com/drive/folders/1Wq6wC3eJUYKrfPNuE9kURJyfQL2vHfX1?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Digital Electronics') {
      return 'https://drive.google.com/drive/folders/1QZYd082BgYXKgEsN89-ELABZJi0eR4rY?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Financial and Managerial Accounting') {
      return 'https://drive.google.com/drive/folders/1HYDBeWPq8fzhEl93jLYCd4GoJXhJhRQZ?usp=drive_link';
    }
    if (department == 'CSE' && course == 'System Analysis & Design') {
      return 'https://drive.google.com/drive/folders/1Mnx5MRei74YXjtFshtSntywrKFWj1Vd2?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Economics') {
      return 'https://drive.google.com/drive/folders/17hNPCpRWxcpIECqOhvhYmuadD9Qyj6RZ?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Software Project II') {
      return 'https://drive.google.com/drive/folders/1Y7YSuoVrA8NIaPjVvGmR2rdGWc7eNPzB?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Software Project I') {
      return 'https://drive.google.com/drive/folders/194x1fOTxTlIgidmw9nsKmomelTdX8S7H?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Engineering Mathematics') {
      return 'https://drive.google.com/drive/folders/1UL2vAW91pSnz8f6DC3b5uETGFfI4JsVB?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Basic Electronics') {
      return 'https://drive.google.com/drive/folders/1Zfzkp2kpNU6uXjjC9wFQiwESZFnDBfYH?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Data Communication') {
      return 'https://drive.google.com/drive/folders/1ojJvzE0o7skYySPPRs56Ifwu0dZ3x6pp?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Basic Electronics Lab') {
      return 'https://drive.google.com/drive/folders/1eBmDA8GlKApADgP8bt7NPhi0x7Wlz453?usp=drive_link';
    }
    if (department == 'CSE' && course == 'History of Bangladesh and Bangla Language') {
      return 'https://drive.google.com/drive/folders/1HYDBeWPq8fzhEl93jLYCd4GoJXhJhRQZ?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Bangladesh Studies') {
      return 'https://drive.google.com/drive/folders/1sJSkAM68OvYaF88YaaYezHfftFdU1u3p?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Electrical Circuits') {
      return 'https://drive.google.com/drive/folders/1BzLUVZ5opo85uAfZYfz1WmBy71DV1IL0?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Art of Living') {
      return 'https://drive.google.com/drive/folders/1ktR-9LNWhVOsln0hbKOBX0rbYBJR5YFL?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Programming and Problem Solving') {
      return 'https://drive.google.com/drive/folders/1E2OOCv7aGM0SdiWtH89vaycTqLQH-gsd?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Business Application Design and Employability') {
      return 'https://drive.google.com/drive/folders/17sWNpnI1l-i57mpuAyzu3xYoW-joaAtY?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Mathematics-II: Calculus, Complex Variables & Linear Algebra') {
      return 'https://drive.google.com/drive/folders/1nyWuslTH1fhaljuWOTjU44jULRimM9En?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Writing and Comprehension') {
      return 'https://drive.google.com/drive/folders/1D82en38fHu7pQgHIYMewhQdb9q8uKTvP?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Basic Functional English and English Spoken') {
      return 'https://drive.google.com/drive/folders/1VDprie7nLIEYkumX15qPdH7jGauxx57m?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Computer Fundamentals') {
      return 'https://drive.google.com/drive/folders/1Q9j-uPgiuDENt8PKsRZ7oY6htm9yNYuc?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Statistics and Probability') {
      return 'https://drive.google.com/drive/folders/1PvWDI8cAfiY89xuMw1NhfIFyabYsg-KD?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Numerical Methods') {
      return 'https://drive.google.com/drive/folders/1lvI2Z3nveGUofqrXF4UIGR7MMUzHmJ7z?usp=drive_link';
      
    }
     if (department == 'CSE' && course == 'Basic Physics') {
      return 'https://drive.google.com/drive/folders/1kvddYumlDnRXQnVFFRQ_MnSoTte6qfpW?usp=drive_link';
     
     }
    if (department == 'CSE' && course == 'Basic Mathematics') {
      return 'https://drive.google.com/drive/folders/1DqrdeibfgxrfOBXDeJv-phmlfkS0rKyF?usp=drive_link';
     
     }
    if (department == 'CSE' && course == 'Basic Physics Lab') {
      return 'https://drive.google.com/drive/folders/1KCWwDg_Cee1pHWw2dcUkG0AKMWaNaQc6?usp=drive_link';
     
     }
    if (department == 'CSE' && course == 'Electrical Circuits Lab') {
      return 'https://drive.google.com/drive/folders/1eBmDA8GlKApADgP8bt7NPhi0x7Wlz453?usp=drive_link';
     
     }
    if (department == 'CSE' && course == 'Object Oriented Programming Lab') {
      return 'https://drive.google.com/drive/folders/1q-mWo9q0fh3Lm3R2lO5waUgZ1P-q9JBE?usp=drive_link';
     
     }
    if (department == 'CSE' && course == 'Intro to Biology and Chemistry for Computation') {
      return 'https://drive.google.com/drive/folders/172Qx454m20JSY0c3i5OrPsPj5Z1Mkt2U?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Principles Of Robotics') {
      return 'https://drive.google.com/drive/folders/1f_mpyv_OK_4KiDyJKdlIeihVYNvxwr9R?usp=drive_link';
    }
    if (department == 'CSE' && course == 'Social and Professional Issues in Computing') {
      return 'https://drive.google.com/drive/folders/1F45QUe276WVGSfoj9TS-DVGImWB-S30o?usp=drive_link';
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
