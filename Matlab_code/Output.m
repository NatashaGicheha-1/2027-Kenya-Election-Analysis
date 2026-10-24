     UserID         County       AgeGroup     PrimaryPlatform    PoliticalInterest         TopIssue         TrustLevel    SharingProbability    CandidatePreference    IsInfluencer    Followers    Following    Exposed
    _________    ____________    _________    _______________    _________________    __________________    __________    __________________    ___________________    ____________    _________    _________    _______

    {'U0001'}    {'Nairobi' }    {'60+'  }     {'Facebook'}         {'High'  }        {'Cost of Living'}       0.51             0.193             {'Candidate C'}           0              4           15           0   
    {'U0002'}    {'Kiambu'  }    {'25-34'}     {'Facebook'}         {'Medium'}        {'Cost of Living'}      0.513              0.35             {'Candidate A'}           0              3            1           0   
    {'U0003'}    {'Nairobi' }    {'45-59'}     {'Facebook'}         {'Low'   }        {'Jobs'          }      0.328             0.304             {'Undecided'  }           0              5            7           0   
    {'U0004'}    {'Nakuru'  }    {'18-24'}     {'WhatsApp'}         {'Low'   }        {'Corruption'    }      0.448             0.333             {'Candidate B'}           0             15           10           0   
    {'U0005'}    {'Nakuru'  }    {'25-34'}     {'Facebook'}         {'Low'   }        {'Jobs'          }      0.314             0.166             {'Candidate A'}           0              4            1           0   
    {'U0006'}    {'Machakos'}    {'60+'  }     {'YouTube' }         {'High'  }        {'Corruption'    }      0.918             0.774             {'Candidate B'}           0             11           16           0   
    {'U0007'}    {'Kiambu'  }    {'35-44'}     {'WhatsApp'}         {'Medium'}        {'Jobs'          }      0.438              0.23             {'Candidate B'}           0              1            4           0   
    {'U0008'}    {'Meru'    }    {'35-44'}     {'WhatsApp'}         {'Low'   }        {'Healthcare'    }      0.469             0.338             {'Candidate C'}           0              4            6           0   

    SourceUser    TargetUser     EdgeType     TrustWeight    SameCounty
    __________    __________    __________    ___________    __________

    {'U0001'}     {'U0293'}     {'Friend'}       0.666           0     
    {'U0001'}     {'U0848'}     {'Friend'}       0.732           1     
    {'U0001'}     {'U1023'}     {'Follow'}       0.378           1     
    {'U0001'}     {'U1797'}     {'Friend'}       0.587           0     
    {'U0002'}     {'U0096'}     {'Follow'}       0.399           0     
    {'U0002'}     {'U0188'}     {'Follow'}        0.39           0     
    {'U0002'}     {'U1790'}     {'Follow'}       0.372           0     
    {'U0003'}     {'U0782'}     {'Follow'}       0.569           0     

    MessageID        Candidate              Topic             Platform          Format               Tone             Language       Virality    SeedUser     ReleaseDay                                       Headline                                   
    _________    _________________    __________________    ____________    _______________    _________________    _____________    ________    _________    __________    ______________________________________________________________________________

    {'M001'}     {'Candidate B'  }    {'Jobs'          }    {'Facebook'}    {'Image/Meme' }    {'Hopeful'      }    {'English'  }     0.546      {'U0376'}        23        {'[Synthetic] Candidate B: promise of youth jobs and apprenticeships'        }
    {'M002'}     {'Civic/Neutral'}    {'Corruption'    }    {'Facebook'}    {'Text post'  }    {'Informational'}    {'English'  }     0.402      {'U0695'}         8        {'[Synthetic] Civic explainer on corruption'                                 }
    {'M003'}     {'Candidate C'  }    {'Healthcare'    }    {'Facebook'}    {'Short video'}    {'Attack'       }    {'Sheng'    }     0.636      {'U1574'}        30        {'[Synthetic] Candidate C: commitment to fix SHA rollout and hospital stocks'}
    {'M004'}     {'Candidate B'  }    {'Healthcare'    }    {'YouTube' }    {'Text post'  }    {'Informational'}    {'Sheng'    }     0.323      {'U0687'}         7        {'[Synthetic] Candidate B: pledge on affordable clinics'                     }
    {'M005'}     {'Candidate C'  }    {'Corruption'    }    {'Facebook'}    {'Image/Meme' }    {'Humour'       }    {'Kiswahili'}     0.429      {'U1069'}        12        {'[Synthetic] Candidate C: vow to prosecute misuse of public funds'          }
    {'M006'}     {'Candidate C'  }    {'Jobs'          }    {'WhatsApp'}    {'Text post'  }    {'Informational'}    {'Sheng'    }     0.364      {'U1321'}        11        {'[Synthetic] Candidate C: promise of youth jobs and apprenticeships'        }
    {'M007'}     {'Candidate B'  }    {'Jobs'          }    {'TikTok'  }    {'Short video'}    {'Informational'}    {'Kiswahili'}     0.482      {'U0239'}        28        {'[Synthetic] Candidate B: plan to support small traders (jua kali)'         }
    {'M008'}     {'Candidate C'  }    {'Infrastructure'}    {'YouTube' }    {'Image/Meme' }    {'Attack'       }    {'English'  }     0.563      {'U1548'}        17        {'[Synthetic] Candidate C: plan for rural electricity'                       }

    {'U0001'}
    {'U0002'}
    {'U0003'}
    {'U0004'}
    {'U0005'}

    {'U0001'}
    {'U0001'}
    {'U0001'}
    {'U0001'}
    {'U0002'}

     1
     1
     1
     1
     2


ans =

        2000


ans =

       12681


ans = 10×1
      4
      3
      5
     15
      4
     11
      1
      4
      6
      2

     UserID         County       AgeGroup     PrimaryPlatform    PoliticalInterest         TopIssue         TrustLevel    SharingProbability    CandidatePreference    IsInfluencer    Followers    Following    Exposed    Shared
    _________    ____________    _________    _______________    _________________    __________________    __________    __________________    ___________________    ____________    _________    _________    _______    ______

    {'U0001'}    {'Nairobi' }    {'60+'  }     {'Facebook'}         {'High'  }        {'Cost of Living'}       0.51             0.193             {'Candidate C'}           0              4           15           0         0   
    {'U0002'}    {'Kiambu'  }    {'25-34'}     {'Facebook'}         {'Medium'}        {'Cost of Living'}      0.513              0.35             {'Candidate A'}           0              3            1           0         0   
    {'U0003'}    {'Nairobi' }    {'45-59'}     {'Facebook'}         {'Low'   }        {'Jobs'          }      0.328             0.304             {'Undecided'  }           0              5            7           0         0   
    {'U0004'}    {'Nakuru'  }    {'18-24'}     {'WhatsApp'}         {'Low'   }        {'Corruption'    }      0.448             0.333             {'Candidate B'}           0             15           10           0         0   
    {'U0005'}    {'Nakuru'  }    {'25-34'}     {'Facebook'}         {'Low'   }        {'Jobs'          }      0.314             0.166             {'Candidate A'}           0              4            1           0         0   
    {'U0006'}    {'Machakos'}    {'60+'  }     {'YouTube' }         {'High'  }        {'Corruption'    }      0.918             0.774             {'Candidate B'}           0             11           16           0         0   
    {'U0007'}    {'Kiambu'  }    {'35-44'}     {'WhatsApp'}         {'Medium'}        {'Jobs'          }      0.438              0.23             {'Candidate B'}           0              1            4           0         0   
    {'U0008'}    {'Meru'    }    {'35-44'}     {'WhatsApp'}         {'Low'   }        {'Healthcare'    }      0.469             0.338             {'Candidate C'}           0              4            6           0         0   


users: 2000×14 table

Variables:

    UserID: cell array of character vectors
    County: cell array of character vectors
    AgeGroup: cell array of character vectors
    PrimaryPlatform: cell array of character vectors
    PoliticalInterest: cell array of character vectors
    TopIssue: cell array of character vectors
    TrustLevel: double
    SharingProbability: double
    CandidatePreference: cell array of character vectors
    IsInfluencer: double
    Followers: double
    Following: double
    Exposed: double
    Shared: double

Statistics for applicable variables:

                           NumMissing       Min          Median         Max           Mean           Std    

    UserID                     0                                                                            
    County                     0                                                                            
    AgeGroup                   0                                                                            
    PrimaryPlatform            0                                                                            
    PoliticalInterest          0                                                                            
    TopIssue                   0                                                                            
    TrustLevel                 0           0.0660        0.4955        0.9700        0.4972         0.1533  
    SharingProbability         0           0.0100        0.2600        0.9500        0.3026         0.2040  
    CandidatePreference        0                                                                            
    IsInfluencer               0                0             0             1        0.0200         0.1400  
    Followers                  0                0             4           712        6.3405        18.4395  
    Following                  0                1             6           188        6.3405         5.7287  
    Exposed                    0                0             0             0             0              0  
    Shared                     0                0             0             0             0              0  

Highest Virality Message Selected:
    MessageID       Candidate           Topic          Platform         Format            Tone         Language       Virality    SeedUser     ReleaseDay                                       Headline                                   
    _________    _______________    ______________    __________    _______________    __________    _____________    ________    _________    __________    ______________________________________________________________________________

    {'M034'}     {'Candidate C'}    {'Healthcare'}    {'TikTok'}    {'Short video'}    {'Attack'}    {'Kiswahili'}     0.789      {'U0293'}        6         {'[Synthetic] Candidate C: commitment to fix SHA rollout and hospital stocks'}

Message Details:
Topic: Healthcare
Candidate: Candidate C
Virality: 0.789
    MessageID        Candidate              Topic             Platform          Format               Tone             Language       Virality    SeedUser     ReleaseDay                                       Headline                                   
    _________    _________________    __________________    ____________    _______________    _________________    _____________    ________    _________    __________    ______________________________________________________________________________

    {'M001'}     {'Candidate B'  }    {'Jobs'          }    {'Facebook'}    {'Image/Meme' }    {'Hopeful'      }    {'English'  }     0.546      {'U0376'}        23        {'[Synthetic] Candidate B: promise of youth jobs and apprenticeships'        }
    {'M002'}     {'Civic/Neutral'}    {'Corruption'    }    {'Facebook'}    {'Text post'  }    {'Informational'}    {'English'  }     0.402      {'U0695'}         8        {'[Synthetic] Civic explainer on corruption'                                 }
    {'M003'}     {'Candidate C'  }    {'Healthcare'    }    {'Facebook'}    {'Short video'}    {'Attack'       }    {'Sheng'    }     0.636      {'U1574'}        30        {'[Synthetic] Candidate C: commitment to fix SHA rollout and hospital stocks'}
    {'M004'}     {'Candidate B'  }    {'Healthcare'    }    {'YouTube' }    {'Text post'  }    {'Informational'}    {'Sheng'    }     0.323      {'U0687'}         7        {'[Synthetic] Candidate B: pledge on affordable clinics'                     }
    {'M005'}     {'Candidate C'  }    {'Corruption'    }    {'Facebook'}    {'Image/Meme' }    {'Humour'       }    {'Kiswahili'}     0.429      {'U1069'}        12        {'[Synthetic] Candidate C: vow to prosecute misuse of public funds'          }
    {'M006'}     {'Candidate C'  }    {'Jobs'          }    {'WhatsApp'}    {'Text post'  }    {'Informational'}    {'Sheng'    }     0.364      {'U1321'}        11        {'[Synthetic] Candidate C: promise of youth jobs and apprenticeships'        }
    {'M007'}     {'Candidate B'  }    {'Jobs'          }    {'TikTok'  }    {'Short video'}    {'Informational'}    {'Kiswahili'}     0.482      {'U0239'}        28        {'[Synthetic] Candidate B: plan to support small traders (jua kali)'         }
    {'M008'}     {'Candidate C'  }    {'Infrastructure'}    {'YouTube' }    {'Image/Meme' }    {'Attack'       }    {'English'  }     0.563      {'U1548'}        17        {'[Synthetic] Candidate C: plan for rural electricity'                       }


ans =

  1×11 cell array

  Columns 1 through 7

    {'MessageID'}    {'Candidate'}    {'Topic'}    {'Platform'}    {'Format'}    {'Tone'}    {'Language'}

  Columns 8 through 11

    {'Virality'}    {'SeedUser'}    {'ReleaseDay'}    {'Headline'}

          Value    Count   Percent
    Candidate A       37     37.00%
    Candidate B       31     31.00%
    Candidate C       14     14.00%
  Civic/Neutral       18     18.00%
Top 10 Seed Users:
        1193
        1940
        1303
         969
         640
         251
        1667
          95
         975
        1774

Degree Scores of Seed Users:
   712
   222
   123
   105
    86
    82
    82
    73
    67
    65

Number of Exposed Users:
    10

Number of Shared Users:
    10


ans =

  10×3 table

    TimeStep    ExposedUsers    SharedUsers
    ________    ____________    ___________

        1           1147            146    
        2           1412            178    
        3           1454            184    
        4           1463            186    
        5           1465            186    
        6           1465            186    
        7           1465            186    
        8           1465            186    
        9           1465            186    
       10           1465            186    

Simulation Results:
    TimeStep    ExposedUsers    SharedUsers    SaturationRate
    ________    ____________    ___________    ______________

       1            1147            146            57.35     
       2            1412            178             70.6     
       3            1454            184             72.7     
       4            1463            186            73.15     
       5            1465            186            73.25     
       6            1465            186            73.25     
       7            1465            186            73.25     
       8            1465            186            73.25     

Results saved as diffusion_results.csv
Network Structure Results
Original Network Final Exposure: 1465
Random Network Final Exposure: 189
>> 
