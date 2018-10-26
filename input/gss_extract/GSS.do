#delimit ;

   infix
      year     1 - 20
      vstrat   21 - 40
      wtssall  41 - 60
      god      61 - 80
      relig16  81 - 100
      relig    101 - 120
      sex      121 - 140
      educ     141 - 160
      age      161 - 180
      id_      181 - 200
      vpsu     201 - 220
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable vstrat   "Variance stratum";
label variable wtssall  "Weight variable";
label variable god      "Rs confidence in the existence of god";
label variable relig16  "Religion in which raised";
label variable relig    "Rs religious preference";
label variable sex      "Respondents sex";
label variable educ     "Highest year of school completed";
label variable age      "Age of respondent";
label variable id_      "Respondent id number";
label variable vpsu     "Variance primary sampling unit";


label define gsp001x
   9        "No answer"
   8        "Don't know"
   6        "Know god exists"
   5        "Believe but doubts"
   4        "Believe sometimes"
   3        "Some higher power"
   2        "No way to find out"
   1        "Dont believe"
   0        "Not applicable"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp003x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp004x
   2        "Female"
   1        "Male"
;
label define gsp005x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp006x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;


label values god      gsp001x;
label values relig16  gsp002x;
label values relig    gsp003x;
label values sex      gsp004x;
label values educ     gsp005x;
label values age      gsp006x;


