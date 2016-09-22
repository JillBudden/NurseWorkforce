Libname JBlib '\\lansaspd1\Research\Jill Budden\JillB\Workforce2015';
data work.analyses;
	set JBlib.ncsbn_rn_final_weighted;

/* use file name complete_file_dedup_deidentified_RN2015 */

/* FIELD NAMES */
/*
TIEBACK,
RESPONSE_TYPE,
WAVE,
ID,
JURISDICTION,
IMAGE_FILENAME,
UNDELIVERABLE_FLAG,

Q1_GENDER,
Q2_NATIVE, Q2_ASIAN, Q2_BLACK, Q2_PACIFICISLANDER, Q2_WHITE, Q2_HISPANIC, Q2_OTHER,
Q3_YEARBORN, 
Q4_FIRSTDEGREE, 
Q5_HIGHESTEDUCATION,
Q6_RN, Q6_LPN_VN, Q6_APRN,
Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, Q7_NONE,
Q8_YEAR_INITIAL_LIC,
Q9_COUNTRY_EDUCATION, Q9_SPECIFY,
Q10_COUNTRY_LIC, Q10_SPECIFY,

Q11_AK, Q11_AL, Q11_AR, Q11_AZ, Q11_CA, Q11_CO, Q11_CT, Q11_DC, Q11_DE, Q11_FL, Q11_GA,
Q11_HI, Q11_IA, Q11_ID, Q11_IL, Q11_IN, Q11_KS, Q11_KY, Q11_LA, Q11_MA, Q11_MD, Q11_ME,
Q11_MI, Q11_MN, Q11_MO, Q11_MS, Q11_MT, Q11_NC, Q11_ND, Q11_NE, Q11_NH, Q11_NJ, Q11_NM,
Q11_NV, Q11_NY, Q11_OH, Q11_OK, Q11_OR, Q11_PA, Q11_RI, Q11_SC, Q11_SD, Q11_TN, Q11_TX,
Q11_UT, Q11_VA, Q11_VT, Q11_WA, Q11_WI, Q11_WV, Q11_WY, Q11_AS, Q11_GU, Q11_MP, Q11_VI,

Q12_AK, Q12_AL, Q12_AR, Q12_AZ, Q12_CA, Q12_CO, Q12_CT, Q12_DC, Q12_DE, Q12_FL, Q12_GA,
Q12_HI, Q12_IA, Q12_ID, Q12_IL, Q12_IN, Q12_KS, Q12_KY, Q12_LA, Q12_MA, Q12_MD, Q12_ME,
Q12_MI, Q12_MN, Q12_MO, Q12_MS, Q12_MT, Q12_NC, Q12_ND, Q12_NE, Q12_NH, Q12_NJ, Q12_NM,
Q12_NV, Q12_NY, Q12_OH, Q12_OK, Q12_OR, Q12_PA, Q12_RI, Q12_SC, Q12_SD, Q12_TN, Q12_TX,
Q12_UT, Q12_VA, Q12_VT, Q12_WA, Q12_WI, Q12_WV, Q12_WY, Q12_AS, Q12_GU, Q12_MP, Q12_VI,

Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM, Q13_OTHER_FULLTIME,
Q13_OTHER_PARTTIME, Q13_OTHER_PERDIEM, Q13_NURSING_VOLUNTEER, Q13_UNEMPLOYED_SEEKING,
Q13_UNEMPLOYED_NOT_SEEKING, Q13_RETIRED,

Q14_FAMILY, Q14_DISABLED, Q14_SALARY, Q14_SCHOOL, Q14_DIFFICULT_FINDING, Q14_OTHER, Q14_SPECIFY, 
Q15_NUM_POSITIONS, 
Q16_HOURS,

Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC,
Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL,

Q18_PRIMARY_STATE, Q18_PRIMARY_ZIP, 
Q19_PRIMARY_SALARY, 
Q20_PRIMARY_SETTING, 
Q21_PRIMARY_TITLE, 
Q22_PRIMARY_SPECIALTY, Q22_SPECIFY,
Q23_SECONDARY_STATE, Q23_SECONDARY_STATE, 
Q24_SECONDARY_SALARY, Q24_NO_SECONDARY,
Q25_SECONDARY_SETTING, 
Q26_SECONDARY_TITLE, 
Q27_SECONDARY_SPECIALTY, Q27_SPECIFY,
Q28_TELEHEALTH,
Q29_TELEHEALTH_STATEBORDER,
Q30_TELEHEALTH_NATIONALBORDER,

Q31_NA, Q31_ELECTRONIC_MESSAGE, Q31_VOIP, Q31_VIRTUAL_ICU, Q31_TELEPHONE, Q31_EMAIL,
Q31_VIDEOCALL, Q31_OTHER, Q31_SPECIFY 			*/

/* make "respondent" variable */
if RESPONSE_TYPE ^= " " then respondent = 1;

/* clean race/ethnicty variable */

if Q2_NATIVE = 1 and Q2_ASIAN = 0 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 0 and Q2_HISPANIC = 0 and Q2_OTHER = 0 then NATIVE = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 1 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 0 and Q2_HISPANIC = 0 and Q2_OTHER = 0 then ASIAN = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 0 and Q2_BLACK = 1 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 0 and Q2_HISPANIC = 0 and Q2_OTHER = 0 then BLACK = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 0 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 1 and Q2_WHITE = 0 and Q2_HISPANIC = 0 and Q2_OTHER = 0 then PACIFICISLANDER = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 0 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 1 and Q2_HISPANIC = 0 and Q2_OTHER = 0 then WHITE = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 0 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 0 and Q2_HISPANIC = 1 and Q2_OTHER = 0 then HISPANIC = 1;
if Q2_NATIVE = 0 and Q2_ASIAN = 0 and Q2_BLACK = 0 and Q2_PACIFICISLANDER = 0 and Q2_WHITE = 0 and Q2_HISPANIC = 0 and Q2_OTHER = 1 then OTHER = 1;

if Q2_NATIVE = 1 and Q2_ASIAN = 1 then MIXED_RACE = 1;
if Q2_NATIVE = 1 and Q2_BLACK = 1 then MIXED_RACE = 1;
if Q2_NATIVE = 1 and Q2_PACIFICISLANDER = 1 then MIXED_RACE = 1;
if Q2_NATIVE = 1 and Q2_WHITE = 1 then MIXED_RACE = 1;
if Q2_NATIVE = 1 and Q2_HISPANIC = 1 then MIXED_RACE = 1;
if Q2_NATIVE = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

if Q2_ASIAN = 1 and Q2_BLACK = 1 then MIXED_RACE = 1;
if Q2_ASIAN = 1 and Q2_PACIFICISLANDER = 1 then MIXED_RACE = 1;
if Q2_ASIAN = 1 and Q2_WHITE = 1 then MIXED_RACE = 1;
if Q2_ASIAN = 1 and Q2_HISPANIC = 1 then MIXED_RACE = 1;
if Q2_ASIAN = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

if Q2_BLACK = 1 and Q2_PACIFICISLANDER = 1 then MIXED_RACE = 1;
if Q2_BLACK = 1 and Q2_WHITE = 1 then MIXED_RACE = 1;
if Q2_BLACK = 1 and Q2_HISPANIC = 1 then MIXED_RACE = 1;
if Q2_BLACK = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

if Q2_PACIFICISLANDER = 1 and Q2_WHITE = 1 then MIXED_RACE = 1;
if Q2_PACIFICISLANDER = 1 and Q2_HISPANIC = 1 then MIXED_RACE = 1;
if Q2_PACIFICISLANDER = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

if Q2_WHITE = 1 and Q2_HISPANIC = 1 then MIXED_RACE = 1;
if Q2_WHITE = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

if Q2_HISPANIC = 1 and Q2_OTHER = 1 then MIXED_RACE = 1;

/* Edit Year Born variable removing incomplete years and respondents born 1910 and earlier and 1998 and after */

if Q3_YEARBORN NOT in ("1910", "1911", "1912", "1913", "1914", "1915", "1916", "1917", "1918", "1919", "1920" "1921", 
"1922", "1923", "1924", "1925", "1926", "1927",
"1928", "1929", "1930", "1931", "1932", "1933", "1934", "1935", "1936", "1937", "1938", "1939", "1940", "1941", "1942",
"1943", "1944", "1945", "1946", "1947", "1948", "1949", "1950", "1951", "1952", "1953", "1954", "1955", "1956", "1957",
"1958", "1959", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1970", "1971", "1972",
"1973", "1974", "1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987",
"1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997") then Q3_YEARBORN = .;

/* Make Year Born variable quanitative */

Q3_YEARBORN_quant = (Q3_YEARBORN + 0);

/* age calculation */
Age = (2015 - Q3_YEARBORN_quant);
if Age > 105 then Age = .;
if Age < 18 then Age = .;

/* Create age grouping variable */
if Age in (18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29) then AgeGroup = 1;
if Age in (30, 31, 32, 33, 34) then AgeGroup = 2;
if Age in (35, 36, 37, 38, 39) then AgeGroup = 3;
if Age in (40, 41, 42, 43, 44) then AgeGroup = 4;
if Age in (45, 46, 47, 48, 49) then AgeGroup = 5;
if Age in (50, 51, 52, 53, 54) then AgeGroup = 6;
if Age in (55, 56, 57, 58, 59) then AgeGroup = 7;
if Age in (60, 61, 62, 63, 64) then AgeGroup = 8;
if Age >= 65 then AgeGroup = 9;

/* Clean CNS responses to include master's and higher education */

if Q5_HIGHESTEDUCATION NOT in (7, 8, 9, 10, 11, 12) then Q7_CNS = .;

/* clean year initial licensure remove 1920 and prior and 2015 and greater */

if Q8_YEAR_INITIAL_LIC in (1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 
	1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920) then Q8_YEAR_INITIAL_LIC = .;

if Q8_YEAR_INITIAL_LIC < 1900 then Q8_YEAR_INITIAL_LIC = .;
if Q8_YEAR_INITIAL_LIC > 2015 then Q8_YEAR_INITIAL_LIC = .;

/* Further clean year initial licensure variable and salary */
if Q8_YEAR_INITIAL_LIC = 2015 then Q19_PRIMARY_SALARY = .;
if Q8_YEAR_INITIAL_LIC = 2015 then Q24_SECONDARY_SALARY = .;

/* Number of years since initial licensure calculation */
YearsSinceLicensure = (2015 - Q8_YEAR_INITIAL_LIC);

/* Create Year Licensed Cohorts where 1 = licensed prior to 2000, 2 = licensed 2000-2009
3 = licensed 2010-2012, and 4 = licensed 2013-2015 */
if Q8_YEAR_INITIAL_LIC in (1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 
	1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959,
	1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 
	1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985,
	1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 
	1999) then YrLicCohort = 1;
if Q8_YEAR_INITIAL_LIC in (2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2009) then YrLicCohort = 2;
if Q8_YEAR_INITIAL_LIC in (2010, 2011, 2012) then YrLicCohort = 3;
if Q8_YEAR_INITIAL_LIC in (2013, 2014, 2015) then YrLicCohort = 4;

/* Create US versus Foreign Educated variable where US educated = 1, Foreign educated = 2 */
if Q9_COUNTRY_EDUCATION = 1 then USvsForeignEd = 1;
if Q9_COUNTRY_EDUCATION = 2 then USvsForeignEd = 2;
if Q9_COUNTRY_EDUCATION = 3 then USvsForeignEd = 2;
if Q9_COUNTRY_EDUCATION = 4 then USvsForeignEd = 2;
if Q9_COUNTRY_EDUCATION = 5 then USvsForeignEd = 2;

/* creating Q11 (states where holding an active license) variable */
Q11total = sum(Q11_AK, Q11_AL, Q11_AR, Q11_AZ, Q11_CA, Q11_CO, Q11_CT, Q11_DC, Q11_DE, Q11_FL, Q11_GA,
	Q11_HI, Q11_IA, Q11_ID, Q11_IL, Q11_IN, Q11_KS, Q11_KY, Q11_LA, Q11_MA, Q11_MD, Q11_ME,
	Q11_MI, Q11_MN, Q11_MO, Q11_MS, Q11_MT, Q11_NC, Q11_ND, Q11_NE, Q11_NH, Q11_NJ, Q11_NM,
	Q11_NV, Q11_NY, Q11_OH, Q11_OK, Q11_OR, Q11_PA, Q11_RI, Q11_SC, Q11_SD, Q11_TN, Q11_TX,
	Q11_UT, Q11_VA, Q11_VT, Q11_WA, Q11_WI, Q11_WV, Q11_WY, Q11_AS, Q11_GU, Q11_MP, Q11_VI);

/* creating Q12 (states currently practicing) variable */
Q12total = sum(Q12_AK, Q12_AL, Q12_AR, Q12_AZ, Q12_CA, Q12_CO, Q12_CT, Q12_DC, Q12_DE, Q12_FL, Q12_GA,
	Q12_HI, Q12_IA, Q12_ID, Q12_IL, Q12_IN, Q12_KS, Q12_KY, Q12_LA, Q12_MA, Q12_MD, Q12_ME,
	Q12_MI, Q12_MN, Q12_MO, Q12_MS, Q12_MT, Q12_NC, Q12_ND, Q12_NE, Q12_NH, Q12_NJ, Q12_NM,
	Q12_NV, Q12_NY, Q12_OH, Q12_OK, Q12_OR, Q12_PA, Q12_RI, Q12_SC, Q12_SD, Q12_TN, Q12_TX,
	Q12_UT, Q12_VA, Q12_VT, Q12_WA, Q12_WI, Q12_WV, Q12_WY, Q12_AS, Q12_GU, Q12_MP, Q12_VI);

/* Creating Q13 employment variables */

if Q13_NURSING_FULLTIME = 1 then emp_in_nursing = 1;
if Q13_NURSING_PARTTIME = 1 then emp_in_nursing = 1;
if Q13_NURSING_PERDIEM = 1 then emp_in_nursing = 1;

if Q13_OTHER_FULLTIME = 1 then emp_outside_nursing = 1;
if Q13_OTHER_PARTTIME = 1 then emp_outside_nursing = 1;
if Q13_OTHER_PERDIEM = 1 then emp_outside_nursing = 1;

if Q13_OTHER_FULLTIME = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing = 1;
if Q13_OTHER_PARTTIME = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing = 1;
if Q13_OTHER_PERDIEM = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing = 1;

if Q13_OTHER_FULLTIME = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing_full = 1;
if Q13_OTHER_PARTTIME = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing_part = 1;
if Q13_OTHER_PERDIEM = 1 AND Q13_NURSING_FULLTIME = 0 AND Q13_NURSING_PARTTIME = 0
	AND Q13_NURSING_PERDIEM = 0 then emp_fullyoutside_nursing_diem = 1;

/* Remove respondents who should not have answered Q14 (unemployed reasons) */

if Q13_NURSING_FULLTIME = 1 then Q14_FAMILY = .;  
if Q13_NURSING_PARTTIME = 1 then Q14_FAMILY = .; 
if Q13_NURSING_PERDIEM = 1 then Q14_FAMILY = .; 
if Q13_OTHER_FULLTIME = 1 then Q14_FAMILY = .; 
if Q13_OTHER_PARTTIME = 1 then Q14_FAMILY = .; 
if Q13_OTHER_PERDIEM = 1 then Q14_FAMILY = .; 
if Q13_NURSING_VOLUNTEER = 1 then Q14_FAMILY = .; 
if Q13_RETIRED = 1 then Q14_FAMILY = .; 

if Q13_NURSING_FULLTIME = 1 then Q14_DISABLED = .;
if Q13_NURSING_PARTTIME = 1 then Q14_DISABLED = .;
if Q13_NURSING_PERDIEM = 1 then Q14_DISABLED = .;
if Q13_OTHER_FULLTIME = 1 then Q14_DISABLED = .;
if Q13_OTHER_PARTTIME = 1 then Q14_DISABLED = .;
if Q13_OTHER_PERDIEM = 1 then Q14_DISABLED = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_DISABLED = .;
if Q13_RETIRED = 1 then Q14_DISABLED = .; 

if Q13_NURSING_FULLTIME = 1 then Q14_SALARY = .;
if Q13_NURSING_PARTTIME = 1 then Q14_SALARY = .;
if Q13_NURSING_PERDIEM = 1 then Q14_SALARY = .;
if Q13_OTHER_FULLTIME = 1 then Q14_SALARY = .;
if Q13_OTHER_PARTTIME = 1 then Q14_SALARY = .; 
if Q13_OTHER_PERDIEM = 1 then Q14_SALARY = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_SALARY = .;
if Q13_RETIRED = 1 then Q14_SALARY = .;	

if Q13_NURSING_FULLTIME = 1 then Q14_SCHOOL = .;
if Q13_NURSING_PARTTIME = 1 then Q14_SCHOOL = .;
if Q13_NURSING_PERDIEM = 1 then Q14_SCHOOL = .;
if Q13_OTHER_FULLTIME = 1 then Q14_SCHOOL = .;
if Q13_OTHER_PARTTIME = 1 then Q14_SCHOOL = .;
if Q13_OTHER_PERDIEM = 1 then Q14_SCHOOL = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_SCHOOL = .;
if Q13_RETIRED = 1 then Q14_SCHOOL = .;

if Q13_NURSING_FULLTIME = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_NURSING_PARTTIME = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_NURSING_PERDIEM = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_OTHER_FULLTIME = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_OTHER_PARTTIME = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_OTHER_PERDIEM = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_DIFFICULT_FINDING = .;
if Q13_RETIRED = 1 then Q14_DIFFICULT_FINDING = .;

if Q13_NURSING_FULLTIME = 1 then Q14_OTHER = .;
if Q13_NURSING_PARTTIME = 1 then Q14_OTHER = .;
if Q13_NURSING_PERDIEM = 1 then Q14_OTHER = .;
if Q13_OTHER_FULLTIME = 1 then Q14_OTHER = .;
if Q13_OTHER_PARTTIME = 1 then Q14_OTHER = .;
if Q13_OTHER_PERDIEM = 1 then Q14_OTHER = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_OTHER = .;
if Q13_RETIRED = 1 then Q14_OTHER = .;

if Q13_NURSING_FULLTIME = 1 then Q14_SPECIFY  = .;
if Q13_NURSING_PARTTIME = 1 then Q14_SPECIFY  = .;
if Q13_NURSING_PERDIEM = 1 then Q14_SPECIFY  = .;
if Q13_OTHER_FULLTIME = 1 then Q14_SPECIFY  = .;
if Q13_OTHER_PARTTIME = 1 then Q14_SPECIFY  = .;
if Q13_OTHER_PERDIEM = 1 then Q14_SPECIFY  = .;
if Q13_NURSING_VOLUNTEER = 1 then Q14_SPECIFY  = .;
if Q13_RETIRED = 1 then Q14_SPECIFY  = .;

/* Creating hospital versus other setting variable where 1 = Hospital, 2 = other */

if Q20_PRIMARY_SETTING = 1 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 2 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 3 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 4 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 5 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 6 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 7 then HospitalVsOther = 1;
if Q20_PRIMARY_SETTING = 8 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 9 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 10 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 11 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 12 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 13 then HospitalVsOther = 2;
if Q20_PRIMARY_SETTING = 14 then HospitalVsOther = 2;

/* create "has secondary practice position" */

if Q15_NUM_POSITIONS = 2 or 3 then holds_second_position = 1;

/* clean salary variables */

if Q19_PRIMARY_SALARY < 1000 then Q19_PRIMARY_SALARY = .;
if Q24_SECONDARY_SALARY < 1000 then Q24_SECONDARY_SALARY = .;
if Q19_PRIMARY_SALARY > 5000000 then Q19_PRIMARY_SALARY = .;
if Q24_SECONDARY_SALARY > 5000000 then Q24_SECONDARY_SALARY = .;

/* cleaning other, please specify variables */
if Q14_SPECIFY = "." then Q14_SPECIFY = " ";

if Q9_SPECIFY NOT = " " then Q9_COUNTRY_EDUCATION = 5;
if Q10_SPECIFY NOT = " " then Q10_COUNTRY_LIC = 5;
if Q14_SPECIFY NOT = " " then Q14_OTHER = 1; /* need to run 2x one with and without to subtract out number of "." in comments" */
if Q22_SPECIFY NOT = " " then Q22_PRIMARY_SPECIALTY = 29;
if Q27_SPECIFY NOT = " " then Q27_SECONDARY_SPECIALTY = 30;
if Q31_SPECIFY NOT = " " then Q31_OTHER = 1;

/* remove 'no secondary position' responses */

if Q23_SECONDARY_STATE = "No Secondary Practice Position" then Q23_SECONDARY_STATE = .;
if Q25_SECONDARY_SETTING = 1 then Q25_SECONDARY_SETTING = .;
if Q26_SECONDARY_TITLE = 1 then Q26_SECONDARY_TITLE = .;
IF Q27_SECONDARY_SPECIALTY = 1 then Q27_SECONDARY_SPECIALTY = .;

/* clean hours worked per week - remove >= 115 hours */
if Q16_HOURS >= 115 then Q16_HOURS = .;

run; 

/* proc format code */

proc format;
	value Q1_GENDER 
	1 = "Male"
	2 = "Female";
run;

proc format;
	value Q4_FIRSTDEGREE
	1 = "Vocational/practical certificate-nursing"
	2 = "Diploma-nursing"
	3 = "Associate degree-nursing"
	4 = "Baccalaureate degree-nursing"
	5 = "Master’s degree-nursing"
	6 = "Doctoral degree-nursing (DNP)"
	7 = "Doctoral degree-nursing (PhD)"
	8 = "Doctoral degree-nursing other";
run;

proc format;
	value Q5_HIGHESTEDUCATION
	1 = "Vocational/practical certificate-nursing"
	2 = "Diploma-nursing"
	3 = "Associate degree-nursing"
	4 = "Associate degree-other field"
	5 = "Baccalaureate degree-nursing"
	6 = "Baccalaureate degree-other field"
	7 = "Master’s degree-nursing"
	8 = "Master’s degree-other field"
	9 = "Doctoral degree-nursing practice (DNP)"
	10 = "Doctoral degree-nursing (PhD)"
	11 = "Doctoral degree-nursing other"
	12 = "Doctoral degree-other field"
	13 = "Vocational/practical certificate-nursing"
	14 = "Diploma-nursing"
	15 = "Associate degree-nursing"
	16 = "Associate degree-other field"
	17 = "Baccalaureate degree-nursing"
	18 = "Baccalaureate degree-other field"
	19 = "Master’s degree-nursing"
	20 = "Master’s degree-other field"
	21 = "Doctoral degree-nursing practice (DNP)"
	22 = "Doctoral degree-nursing (PhD)"
	23 = "Doctoral degree-nursing other"
	24 = "Doctoral degree-other field";
run;

proc format;
	value Q9_COUNTRY_EDUCATION
	1 = "United States"
	2 = "Canada"
	3 = "Philippines"
	4 = "India"
	5 = "Other";
run;


proc format;
	value Q10_COUNTRY_LIC
	1 = "United States"
	2 = "Canada"
	3 = "Philippines"
	4 = "India"
	5 = "Other";
run;

proc format;
	value Q15_NUM_POSITIONS
	1 = "One"
	2 = "Two"
	3 = "Three or more";
run;

proc format;
	value Q17A_CAMP
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17B_CORRECTIONAL
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17C_DEV_DISABILITY
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17D_FAITH
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17E_FORENSIC
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17F_HOLISTIC
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17G_MILITARY
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17H_TELEHEALTH
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q17I_TRAVEL
	1 = "Yes"
	2 = "No";
run;

proc format;
	value Q20_PRIMARY_SETTING
	1 = "Academic Setting"
	2 = "Ambulatory Care Setting"
	3 = "Assisted Living Facility"
	4 = "Community Health"
	5 = "Correctional Facility"
	6 = "Home Health"
	7 = "Hospital"
	8 = "Insurance Claims/Benefits"
	9 = "Nursing Home/Extended Care"
	10 = "Occupational Health"
	11 = "Policy/Planning/Regulatory/Licensing Agency"
	12 = "Public Health"
	13 = "School Health Service"
	14 = "Other";
run;

proc format;
	value Q21_PRIMARY_TITLE
	1 = "Advanced Practice Nurse"
	2 = "Case Manager"
	3 = "Clinical Nurse Leader"
	4 = "Consultant"
	5 = "Nurse Executive"
	6 = "Nurse Faculty"
	7 = "Nurse Manager"
	8 = "Nurse Researcher"
	9 = "Other-Health Related"
	10 = "Other-Not Health Related"
	11 = "Staff Nurse";
run;

proc format;
	value Q22_PRIMARY_SPECIALTY
	1 = "Acute Care/Critical Care"
	2 = "Adult Health/Family Health"
	3 = "Anesthesia"
	4 = "Community"
	5 = "Emergency/Trauma"
	6 = "Genetics"
	7 = "Geriatric/Gerontology"
	8 = "Home Health"
	9 = "Informatics"
	10 = "Maternal-Child Health"
	11 = "Medical Surgical"
	12 = "Neonatal"
	13 = "Nephrology"
	14 = "Neurology/Neurosurgical"
	15 = "Occupational Health"
	16 = "Oncology"
	17 = "Orthopedic"
	18 = "Palliative Care/Hospice"
	19 = "Pediatrics"
	20 = "Perioperative"
	21 = "Primary Care"
	22 = "Psychiatric/Mental Health/Substance Abuse"
	23 = "Public Health"
	24 = "Radiology"
	25 = "Rehabilitation"
	26 = "School Health"
	27 = "Urology"
	28 = "Women’s Health"
	29 = "Other";
run;

proc format;
	value Q25_SECONDARY_SETTING	
	1 = "No Secondary Practice Position"
	2 = "Academic Setting"
	3 = "Ambulatory Care Setting"
	4 = "Assisted Living Facility"
	5 = "Community Health"
	6 = "Correctional Facility"
	7 = "Home Health"
	8 = "Hospital"
	9 = "Insurance Claims/Benefits"
	10 = "Nursing Home/Extended Care"
	11 = "Occupational Health"
	12 = "Policy/Planning/Regulatory/Licensing Agency"
	13 = "Public Health"
	14 = "School Health Service"
	15 = "Other";
run;

proc format;
	value Q26_SECONDARY_TITLE
	1 = "No Secondary Practice Position"
	2 = "Advanced Practice Nurse"
	3 = "Case Manager"
	4 = "Clinical Nurse Leader"
	5 = "Consultant"
	6 = "Nurse Executive"
	7 = "Nurse Faculty"
	8 = "Nurse Manager"
	9 = "Nurse Researcher"
	10 = "Other-Health Related"
	11 = "Other-Not Health Related"
	12 = "Staff Nurse";
run;

proc format;
	value Q27_SECONDARY_SPECIALTY
	1 = "No Secondary Practice Position"                                                                                                                                                                                                                                                                                                                                          2 = Acute Care/Critical Care
	3 = "Adult Health/Family Health"
	4 = "Anesthesia"
	5 = "Community"
	6 = "Emergency/Trauma"
	7 = "Genetics"
	8 = "Geriatric/Gerontology"
	9 = "Home Health"
	10 = "Informatics"
	11 = "Maternal-Child Health"
	12 = "Medical Surgical"
	13 = "Neonatal"
	14 = "Nephrology"
	15 = "Neurology/Neurosurgical"
	16 = "Occupational Health"
	17 = "Oncology"
	18 = "Orthopedic"
	19 = "Palliative Care/Hospice"
	20 = "Pediatrics"
	21 = "Perioperative"
	22 = "Primary Care"
	23 = "Psychiatric/Mental Health/Substance Abuse"
	24 = "Public Health"
	25 = "Radiology"
	26 = "Rehabilitation"
	27 = "School Health"
	28 = "Urology"
	29 = "Women’s Health"
	30 = "Other";
run;

proc format;
	value Q28_TELEHEALTH 
	1 = "Never"
	2 = "1-25%"
	3 = "26-50%"
	4 = "51-75%"
	5 = "76-100%";
run;

proc format;
	value Q29_TELEHEALTH_NATIONALBORDER
	1 = "Not applicable"
	2 = "Never"
	3 = "1-25%"
	4 = "26-50%"
	5 = "51-75%"
	6 = "76-100%";
run;

proc format;
	value Q30_TELEHEALTH_NATIONALBORDER
	1 = "Not applicable"
	2 = "Never"
	3 = "1-25%"
	4 = "26-50%"
	5 = "51-75%"
	6 = "76-100%";
run;

proc format;
	value AgeGroup 
	1 = "18-29"
	2 = "30-34"
	3 = "35-39"
	4 = "40-44"
	5 = "45-49"
	6 = "50-54"
	7 = "55-59"
	8 = "60-64"
	9 = ">= 65";
run;

proc format;
	value holds_second_position 
	1 = "holds second position";
run;

proc format;
	value emp_in_nursing
	1 = "employed in nursing";
run;

proc format;
	value YrLicCohort
	1 = "prior to 2000"
	2 = "2000-2009"
	3 = "2010-2012"
	4 = "2013-2015";
run;

proc format;
	value respondent
	1 = "responded to survey";
run;

proc format;
	value emp_in_nursing
	1 = "responded to survey";
run;

proc format;
	value HospitalVsOther
	1 = "hospital"
	2 = "other setting";
run;

proc format;
	value holds_second_position
	1 = "holds second position";
run;

proc format;
	value USvsForeignEd
	1 = "US educated"
	2 = "foreign educated";
run;


/********************************************************************************************************/

/**************************************** MAIN ANALYSES *************************************************/

/********************************************************************************************************/

/***************************************/

/****************** AGE ****************/

/***************************************/

/* average age */

Title 'Average Age';
PROC MEANS DATA = WORK.analyses FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		WEIGHT pct_wgtC;
RUN;

/* age distribution */

PROC SQL;
	CREATE VIEW WORK.SORT1 AS
		SELECT AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age Distribution';
PROC FREQ DATA = WORK.SORT1
	ORDER=INTERNAL;
	TABLES AgeGroup / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* gender by age */

proc format;
	value Q1_GENDER 
	1 = "Male"
	2 = "Female";
run;

PROC SQL;
	CREATE VIEW WORK.SORT2 AS
		SELECT AgeGroup, Q1_GENDER, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Gender, by Age';
PROC FREQ DATA = WORK.SORT2
	ORDER=INTERNAL;
	TABLES Q1_GENDER * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	FORMAT AgeGroup AgeGroup. Q1_GENDER Q1_GENDER.;
	WEIGHT pct_wgtC;
RUN;

/* race/ethnicity by age */
	
PROC SQL;
	CREATE VIEW WORK.SORT3 AS
		SELECT AgeGroup, NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Race/ethnicity, by Age';
PROC FREQ DATA = WORK.SORT3
	ORDER=INTERNAL;
	TABLES NATIVE * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES ASIAN * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES BLACK * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES PACIFICISLANDER * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES WHITE * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES HISPANIC * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES OTHER * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	TABLES MIXED_RACE * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	FORMAT AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* initial nursing education, by age */

PROC SQL;
	CREATE VIEW WORK.SORT4 AS
		SELECT AgeGroup, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Initial Nursing Education, by Age';
PROC FREQ DATA = WORK.SORT4
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * AgeGroup / NOCOL NOCUM SCORES=TABLE;
	FORMAT AgeGroup AgeGroup. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;

/* age, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT5 AS
		SELECT AgeGroup, emp_in_nursing, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM, 
				emp_fullyoutside_nursing, Q13_UNEMPLOYED_SEEKING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age, by Employement Status';
PROC FREQ DATA = WORK.SORT5
	ORDER=INTERNAL;
	TABLES emp_in_nursing * AgeGroup  / SCORES=TABLE;
	TABLES Q13_NURSING_FULLTIME * AgeGroup  / SCORES=TABLE;
	TABLES Q13_NURSING_PARTTIME * AgeGroup  / SCORES=TABLE;
	TABLES Q13_NURSING_PERDIEM * AgeGroup  / SCORES=TABLE;
	TABLES emp_fullyoutside_nursing * AgeGroup  / SCORES=TABLE;
	TABLES Q13_UNEMPLOYED_SEEKING * AgeGroup / SCORES=TABLE;
	FORMAT AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* average hours worked in nursing per week, by employment status and age */

PROC SQL;
	CREATE VIEW WORK.SORT6 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, AgeGroup, pct_wgtC
	FROM WORK.analyses
	Where Q13_NURSING_FULLTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.sort6(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME AgeGroup pct_wgtC)
	OUT=WORK.meanSORT7;
	BY AgeGroup;
RUN;

Title 'Average Hours Worked in Nursing per Week, by Employment Status and Age (fulltime)';
PROC MEANS DATA=WORK.meanSORT7 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY AgeGroup;
		WEIGHT pct_wgtC;
		FORMAT AgeGroup AgeGroup.;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT8 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, AgeGroup, pct_wgtC
	FROM WORK.analyses
	Where Q13_NURSING_PARTTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.SORT8(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME AgeGroup pct_wgtC)
	OUT=WORK.meanSORT9;
	BY AgeGroup;
RUN;

Title 'Average Hours Worked in Nursing per Week, by Employment Status and Age (parttime';
PROC MEANS DATA=WORK.meanSORT9 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY AgeGroup;
		WEIGHT pct_wgtC;
		FORMAT AgeGroup AgeGroup.;
RUN;

/* primary employment setting, by age */

PROC SQL;
	CREATE VIEW WORK.SORT10 AS
		SELECT AgeGroup, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Age';
PROC FREQ DATA = WORK.SORT10
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT AgeGroup AgeGroup. Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* Primary Position Title, by Age */

PROC SQL;
	CREATE VIEW WORK.SORT11 AS
		SELECT AgeGroup, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Title, by Age';
PROC FREQ DATA = WORK.SORT11
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT AgeGroup AgeGroup. Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty, by age */
										
PROC SQL;
	CREATE VIEW WORK.SORT12 AS
		SELECT AgeGroup, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Specialty, by Age';
PROC FREQ DATA = WORK.SORT12
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT AgeGroup AgeGroup. Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* specialty setting, by age */
										
PROC SQL;
	CREATE VIEW WORK.SORT13 AS
		SELECT AgeGroup, Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Age';
PROC FREQ DATA = WORK.SORT13
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* registered nurses with secondary nursing positions, by age */

PROC SQL;
	CREATE VIEW WORK.SORT14 AS
		SELECT AgeGroup, holds_second_position, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Registered Nurses with Secondary Nursing Positions, by Age';
PROC FREQ DATA = WORK.SORT14
	ORDER=INTERNAL;
	TABLES holds_second_position * AgeGroup  / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by gender */
			
PROC SQL;
	CREATE VIEW WORK.SORT15 AS
		SELECT YrLicCohort, Q1_GENDER, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Gender';
PROC FREQ DATA = WORK.SORT15
	ORDER=INTERNAL;
	TABLES Q1_GENDER * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q1_GENDER Q1_GENDER.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by racial/ethnic composition */
				
PROC SQL;
	CREATE VIEW WORK.SORT16 AS
		SELECT YrLicCohort, NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Racial/ethnic Composition';
PROC FREQ DATA = WORK.SORT16
	ORDER=INTERNAL;
	TABLES NATIVE * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES ASIAN * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES BLACK * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES PACIFICISLANDER * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES WHITE * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES HISPANIC * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES OTHER * YrLicCohort / NOROW NOCUM SCORES=TABLE;
	TABLES MIXED_RACE * YrLicCohort / NOROW NOCUM SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by initial nursing education */

PROC SQL;
	CREATE VIEW WORK.SORT17 AS
		SELECT YrLicCohort, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Initial Nursing Education';
PROC FREQ DATA = WORK.SORT17
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * YrLicCohort  / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by licensees and employed in nursing licensees */
				
PROC SQL;
	CREATE VIEW WORK.SORT18 AS
		SELECT YrLicCohort, emp_in_nursing, respondent, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Licensees and Employed Licensees';
PROC FREQ DATA = WORK.SORT18
	ORDER=INTERNAL;
	TABLES respondent * YrLicCohort  / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES emp_in_nursing * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. respondent respondent. emp_in_nursing emp_in_nursing.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT19 AS
		SELECT YrLicCohort, emp_in_nursing, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM, 
				emp_fullyoutside_nursing, Q13_UNEMPLOYED_SEEKING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Employement Status';
PROC FREQ DATA = WORK.SORT19
	ORDER=INTERNAL;
	TABLES emp_in_nursing * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_FULLTIME * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_PARTTIME * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_PERDIEM * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES emp_fullyoutside_nursing * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	TABLES Q13_UNEMPLOYED_SEEKING * YrLicCohort  / NOROW NOCUM SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort.;
	WEIGHT pct_wgtC;
RUN;

/* average hours worked per week in nursing, by employment status and year licensed */

PROC SQL;
	CREATE VIEW WORK.SORT20 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, YrLicCohort, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_FULLTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.sort20(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME YrLicCohort pct_wgtC)
	OUT=WORK.meanSORT21;
	BY YrLicCohort;
RUN;

Title 'Average Hours Worked per Week in Nursing, by Employment Status and Year Licensed (fulltime)';
PROC MEANS DATA=WORK.meanSORT21 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY YrLicCohort;
		WEIGHT pct_wgtC;
		FORMAT YrLicCohort YrLicCohort.;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT22 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, YrLicCohort, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_PARTTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.SORT22(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME YrLicCohort pct_wgtC)
	OUT=WORK.meanSORT23;
	BY YrLicCohort;
RUN;

Title 'Average Hours Worked per Week in Nursing, by Employment Status and Year Licensed (parttime)';
PROC MEANS DATA=WORK.meanSORT23 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY YrLicCohort;
		WEIGHT pct_wgtC;
		FORMAT YrLicCohort YrLicCohort.;
RUN;

/* year licensed, by primary employment setting */
			
PROC SQL;
	CREATE VIEW WORK.SORT24 AS
		SELECT YrLicCohort, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Primary Employment Setting';
PROC FREQ DATA = WORK.SORT24
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by secondary employment setting */

PROC SQL;
	CREATE VIEW WORK.SORT25 AS
		SELECT YrLicCohort, Q25_SECONDARY_SETTING, Q15_NUM_POSITIONS, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Primary Employment Setting';
PROC FREQ DATA = WORK.SORT25
	ORDER=INTERNAL;
	TABLES Q25_SECONDARY_SETTING * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q15_NUM_POSITIONS * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q25_SECONDARY_SETTING Q25_SECONDARY_SETTING.
			Q15_NUM_POSITIONS Q15_NUM_POSITIONS.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by primary position title */
			
PROC SQL;
	CREATE VIEW WORK.SORT26 AS
		SELECT YrLicCohort, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Primary Position Setting';
PROC FREQ DATA = WORK.SORT26
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by primary employment specialty */

PROC SQL;
	CREATE VIEW WORK.SORT27 AS
		SELECT YrLicCohort, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Year Licensed, by Primary Employment Specialty';
PROC FREQ DATA = WORK.SORT27
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort. Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* year licensed, by specialty setting */

PROC SQL;
	CREATE VIEW WORK.SORT28 AS
		SELECT YrLicCohort, Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'year licensed, by specialty setting';
PROC FREQ DATA = WORK.SORT28
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT YrLicCohort YrLicCohort.;
	WEIGHT pct_wgtC;
RUN;

/**************************************************************/

/**************** GENDER AND ETHNIC DIVERSITY *****************/

/**************************************************************/

/* gender*/		

PROC SQL;
	CREATE VIEW WORK.SORT29 AS
		SELECT Q1_GENDER, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'gender';
PROC FREQ DATA = WORK.SORT29
	ORDER=INTERNAL;
	TABLES Q1_GENDER / SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER.;
	WEIGHT pct_wgtC;
RUN;
	
/* initial nursing education of registered nurses employed in nursing, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT30 AS
		SELECT Q1_GENDER, Q4_FIRSTDEGREE, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Initial Nursing Educaiton of Registered Nurses Emp;loyed in Nursing, by Gender';
PROC FREQ DATA = WORK.SORT30
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;
			
/* highest level of education of registered nurses employed in nursing, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT31 AS
		SELECT Q1_GENDER, Q5_HIGHESTEDUCATION, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Gender';
PROC FREQ DATA = WORK.SORT31
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER. Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment settings, by gender */	
			
PROC SQL;
	CREATE VIEW WORK.SORT32 AS
		SELECT Q1_GENDER, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Settings, by Gender';
PROC FREQ DATA = WORK.SORT32
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER. Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* primary position title, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT33 AS
		SELECT Q1_GENDER, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Title, by Gender';
PROC FREQ DATA = WORK.SORT33
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER. Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT34 AS
		SELECT Q1_GENDER, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Title, by Gender';
PROC FREQ DATA = WORK.SORT34
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER. Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* specialty setting, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT35 AS
		SELECT Q1_GENDER, Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'specialty setting, by gender';
PROC FREQ DATA = WORK.SORT35
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * Q1_GENDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q1_GENDER Q1_GENDER.;
	WEIGHT pct_wgtC;
RUN;

/* Race/Ethnicity */			

PROC SQL;
	CREATE VIEW WORK.SORT36 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Race/ethnicity';
PROC FREQ DATA = WORK.SORT36
	ORDER=INTERNAL;
	TABLES NATIVE / NOCOL NOCUM SCORES=TABLE;
	TABLES ASIAN / NOCOL NOCUM SCORES=TABLE;
	TABLES BLACK / NOCOL NOCUM SCORES=TABLE;
	TABLES PACIFICISLANDER / NOCOL NOCUM SCORES=TABLE;
	TABLES WHITE / NOCOL NOCUM SCORES=TABLE;
	TABLES HISPANIC / NOCOL NOCUM SCORES=TABLE;
	TABLES OTHER / NOCOL NOCUM SCORES=TABLE;
	TABLES MIXED_RACE / NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* age of registered nurses employed in nursing, by race/ethnicity */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT37;
	BY NATIVE;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - native american';
PROC MEANS DATA=WORK.meanSORT37 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY NATIVE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT38;
	BY ASIAN;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - asian';
PROC MEANS DATA=WORK.meanSORT38 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY ASIAN;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT39;
	BY BLACK;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - black';
PROC MEANS DATA=WORK.meanSORT39 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY BLACK;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT40;
	BY PACIFICISLANDER;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - pacific islander';
PROC MEANS DATA=WORK.meanSORT40 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY PACIFICISLANDER;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT41;
	BY WHITE;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - white';
PROC MEANS DATA=WORK.meanSORT41 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY WHITE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT42;
	BY HISPANIC;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - hispanic';
PROC MEANS DATA=WORK.meanSORT42 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY HISPANIC;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT43;
	BY OTHER;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - other';
PROC MEANS DATA=WORK.meanSORT43 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY OTHER;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = NATIVE ASIAN BLACK PACIFICISLANDER WHITE HISPANIC OTHER MIXED_RACE Age pct_wgtC)
	OUT=WORK.meanSORT44;
	BY MIXED_RACE;
RUN;

Title 'age of registered nurses employed in nursing, by race/ethnicity - mixed race';
PROC MEANS DATA=WORK.meanSORT44 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Age;
		BY MIXED_RACE;
		WEIGHT pct_wgtC;
RUN;

/* initial nursing education of registered nurses employed in nursing, by race/ethnicity */

PROC SQL;
	CREATE VIEW WORK.SORT45 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE, Q4_FIRSTDEGREE, 
		emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Initial Nursing Educaiton of Registered Nurses Employed in Nursing, by Race/ethnicity';
PROC FREQ DATA = WORK.SORT45
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;

/* highest level of education of registered nurses employed in nursing, by race/ethnicty */ 

PROC SQL;
	CREATE VIEW WORK.SORT46 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, Q5_HIGHESTEDUCATION, 
		MIXED_RACE, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Race/ethnicity';
PROC FREQ DATA = WORK.SORT46
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* advanced practice preparation of registered nurses, by race/ethnicity */

PROC SQL;
	CREATE VIEW WORK.SORT47 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Race/ethnicity - NP';
PROC FREQ DATA = WORK.SORT47
	ORDER=INTERNAL;
	TABLES Q7_NP * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_NP * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT48 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Race/ethnicity - CNS';
PROC FREQ DATA = WORK.SORT48
	ORDER=INTERNAL;
	TABLES Q7_CNS * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNS * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT49 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Race/ethnicity - CRNA';
PROC FREQ DATA = WORK.SORT49
	ORDER=INTERNAL;
	TABLES Q7_CRNA * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CRNA * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT50 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, emp_in_nursing, pct_wgtC
	FROM WORK.analyses
	WHERE emp_in_nursing = 1;
QUIT;

Title 'Highest Level of Education of Registered Nurses Employed in Nursing, by Race/ethnicity - CNM';
PROC FREQ DATA = WORK.SORT50
	ORDER=INTERNAL;
	TABLES Q7_CNM * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q7_CNM * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* primary employment setting, by race/ethnicity */

PROC SQL;
	CREATE VIEW WORK.SORT51 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Race/ethnicity';
PROC FREQ DATA = WORK.SORT51
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q20_PRIMARY_SETTING * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* primary position title, by race/ethnicity */								

PROC SQL;
	CREATE VIEW WORK.SORT52 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE, 
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Title, by Race/ethnicity' ;
PROC FREQ DATA = WORK.SORT52
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q21_PRIMARY_TITLE * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty, by race/ethnicity */							

PROC SQL;
	CREATE VIEW WORK.SORT53 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
		Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Specialty, by Race/ethnicity' ;
PROC FREQ DATA = WORK.SORT53
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * NATIVE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * ASIAN / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * BLACK / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * PACIFICISLANDER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * WHITE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * HISPANIC / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * OTHER / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q22_PRIMARY_SPECIALTY * MIXED_RACE / NOCOL NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* specialty setting, by race/ethnicity */

PROC SQL;
	CREATE VIEW WORK.SORT54 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - native american';
PROC FREQ DATA = WORK.SORT54
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * NATIVE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT55 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - asian';
PROC FREQ DATA = WORK.SORT55
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * ASIAN / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT56 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - black';
PROC FREQ DATA = WORK.SORT56
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * BLACK / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;	

PROC SQL;
	CREATE VIEW WORK.SORT57 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - pacific islander';
PROC FREQ DATA = WORK.SORT57
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * PACIFICISLANDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT58 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - white';
PROC FREQ DATA = WORK.SORT58
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * WHITE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT59 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - hispanic';
PROC FREQ DATA = WORK.SORT59
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * HISPANIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT60 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - other';
PROC FREQ DATA = WORK.SORT60
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * OTHER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT61 AS
		SELECT NATIVE, ASIAN, BLACK, PACIFICISLANDER, WHITE, HISPANIC, OTHER, MIXED_RACE,
			Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC, 
			Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Race/ethnicity - mixed race';
PROC FREQ DATA = WORK.SORT61
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * MIXED_RACE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/***********************************************************/

/****************** EDUCATION AND LICENSING ****************/

/***********************************************************/

/* type of nursing degree/credential that qualified respondents for first US nursing license */

PROC SQL;
	CREATE VIEW WORK.SORT62 AS
		SELECT Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Type of Nursing Degree/credential that Qualified Respondents for First US Nursing License';
PROC FREQ DATA = WORK.SORT62
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;

/* highest level of education */
	
PROC SQL;
	CREATE VIEW WORK.SORT63 AS
		SELECT Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education';
PROC FREQ DATA = WORK.SORT63
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* highest education, by initial nursing education */

PROC SQL;
	CREATE VIEW WORK.SORT64 AS
		SELECT Q5_HIGHESTEDUCATION, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Education, by Initial Nursing Education';
PROC FREQ DATA = WORK.SORT64
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q4_FIRSTDEGREE / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;


PROC SQL;
	CREATE VIEW WORK.SORT64b AS
		SELECT Q5_HIGHESTEDUCATION, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Education, by Initial Nursing Education B';
PROC FREQ DATA = WORK.SORT64b
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q4_FIRSTDEGREE / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;

/* country where entry-level education received */ 
		
PROC SQL;
	CREATE VIEW WORK.SORT65 AS
		SELECT Q9_COUNTRY_EDUCATION, Q9_SPECIFY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Country Where Entry-level Education Received';
PROC FREQ DATA = WORK.SORT65
	ORDER=INTERNAL;
	TABLES Q9_COUNTRY_EDUCATION / NOROW SCORES=TABLE;
	TABLES Q9_SPECIFY / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT Q9_COUNTRY_EDUCATION Q9_COUNTRY_EDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* years since initial US licensure */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = YearsSinceLicensure MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT66;
	BY MIXED_RACE;
RUN;

Title 'Years Since Initial US Licensure';
PROC MEANS DATA=WORK.meanSORT66 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR YearsSinceLicensure;
		WEIGHT pct_wgtC;
RUN;

/* country where initially licensed as an RN or LPN/VN */

PROC SQL;
	CREATE VIEW WORK.SORT67 AS
		SELECT Q10_COUNTRY_LIC, Q10_SPECIFY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Country Where Initially Licensed as an RN or LPN/VN';
PROC FREQ DATA = WORK.SORT67
	ORDER=INTERNAL;
	TABLES Q10_COUNTRY_LIC / NOROW NOCUM SCORES=TABLE;
	TABLES Q10_SPECIFY / NOROW NOCUM SCORES=TABLE;
	FORMAT Q10_COUNTRY_LIC Q9_LIC.;
	WEIGHT pct_wgtC;
RUN;

/* type of license currently held */	

PROC SQL;
	CREATE VIEW WORK.SORT68 AS
		SELECT Q6_RN, Q6_LPN_VN, Q6_APRN, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Type of License Currently Held';
PROC FREQ DATA = WORK.SORT68
	ORDER=INTERNAL;
	TABLES Q6_RN / NOROW NOCUM SCORES=TABLE;
	TABLES Q6_LPN_VN / NOROW NOCUM SCORES=TABLE;
	TABLES Q6_APRN / NOROW NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* currently licensed/certified as an advanced practice registered nurse */

PROC SQL;
	CREATE VIEW WORK.SORT69 AS
		SELECT Q7_NP, Q7_CNS, Q7_CRNA, Q7_CNM, Q7_NONE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Currently Licensed/certified as an Advanced Practice Registered Nurse';
PROC FREQ DATA = WORK.SORT69
	ORDER=INTERNAL;
	TABLES Q7_NP / NOROW NOCUM SCORES=TABLE;
	TABLES Q7_CNS / NOROW NOCUM SCORES=TABLE;
	TABLES Q7_CRNA / NOROW NOCUM SCORES=TABLE;
	TABLES Q7_CNM / NOROW NOCUM SCORES=TABLE;
	TABLES Q7_NONE / NOROW NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* all states in which registered nurses held an active license to practice */

PROC SQL;
	CREATE VIEW WORK.SORT70 AS
		SELECT Q11_AK, Q11_AL, Q11_AR, Q11_AZ, Q11_CA, Q11_CO, Q11_CT, Q11_DC, Q11_DE, Q11_FL, Q11_GA, 
		Q11_HI, Q11_IA, Q11_ID, Q11_IL, Q11_IN, Q11_KS, Q11_KY, Q11_LA, Q11_MA, Q11_MD, Q11_ME,
		Q11_MI, Q11_MN, Q11_MO, Q11_MS, Q11_MT, Q11_NC, Q11_ND, Q11_NE, Q11_NH, Q11_NJ, Q11_NM,
		Q11_NV, Q11_NY, Q11_OH, Q11_OK, Q11_OR, Q11_PA, Q11_RI, Q11_SC, Q11_SD, Q11_TN, Q11_TX,
		Q11_UT, Q11_VA, Q11_VT, Q11_WA, Q11_WI, Q11_WV, Q11_WY, Q11_AS, Q11_GU, Q11_MP, Q11_VI, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'All States in Which Registered Nurses Held an Active License to Practice';
PROC FREQ DATA = WORK.SORT70
	ORDER=INTERNAL;
	TABLES Q11_AK / SCORES=TABLE;
	TABLES Q11_AL / SCORES=TABLE;
	TABLES Q11_AR / SCORES=TABLE;
	TABLES Q11_AZ / SCORES=TABLE;
	TABLES Q11_CA / SCORES=TABLE;
	TABLES Q11_CO / SCORES=TABLE;
	TABLES Q11_CT / SCORES=TABLE;
	TABLES Q11_DC / SCORES=TABLE;
	TABLES Q11_DE / SCORES=TABLE;
	TABLES Q11_FL / SCORES=TABLE;
	TABLES Q11_GA / SCORES=TABLE;
	TABLES Q11_HI / SCORES=TABLE;
	TABLES Q11_IA / SCORES=TABLE;
	TABLES Q11_ID / SCORES=TABLE;
	TABLES Q11_IL / SCORES=TABLE;
	TABLES Q11_IN / SCORES=TABLE;
	TABLES Q11_KS / SCORES=TABLE;
	TABLES Q11_KY / SCORES=TABLE;
	TABLES Q11_LA / SCORES=TABLE;
	TABLES Q11_MA / SCORES=TABLE;
	TABLES Q11_MD / SCORES=TABLE;
	TABLES Q11_ME / SCORES=TABLE;
	TABLES Q11_MI / SCORES=TABLE;
	TABLES Q11_MN / SCORES=TABLE;
	TABLES Q11_MO / SCORES=TABLE;
	TABLES Q11_MS / SCORES=TABLE;
	TABLES Q11_MT / SCORES=TABLE;
	TABLES Q11_NC / SCORES=TABLE;
	TABLES Q11_ND / SCORES=TABLE;
	TABLES Q11_NE / SCORES=TABLE;
	TABLES Q11_NH / SCORES=TABLE;
	TABLES Q11_NJ / SCORES=TABLE;
	TABLES Q11_NM / SCORES=TABLE;
	TABLES Q11_NV / SCORES=TABLE;
	TABLES Q11_NY / SCORES=TABLE;
	TABLES Q11_OH / SCORES=TABLE;
	TABLES Q11_OK / SCORES=TABLE;
	TABLES Q11_OR / SCORES=TABLE;
	TABLES Q11_PA / SCORES=TABLE;
	TABLES Q11_RI / SCORES=TABLE;
	TABLES Q11_SC / SCORES=TABLE;
	TABLES Q11_SD / SCORES=TABLE;
	TABLES Q11_TN / SCORES=TABLE;
	TABLES Q11_TX / SCORES=TABLE;
	TABLES Q11_UT / SCORES=TABLE;
	TABLES Q11_VA / SCORES=TABLE;
	TABLES Q11_VT / SCORES=TABLE;
	TABLES Q11_WA / SCORES=TABLE;
	TABLES Q11_WI / SCORES=TABLE;
	TABLES Q11_WV / SCORES=TABLE;
	TABLES Q11_WY / SCORES=TABLE;
	TABLES Q11_AS / SCORES=TABLE;
	TABLES Q11_GU / SCORES=TABLE;
	TABLES Q11_MP / SCORES=TABLE;
	TABLES Q11_VI / SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* all states in which registered nurses were currently practicing */		

PROC SQL;
	CREATE VIEW WORK.SORT71 AS
		SELECT Q12_AK, Q12_AL, Q12_AR, Q12_AZ, Q12_CA, Q12_CO, Q12_CT, Q12_DC, Q12_DE, Q12_FL, Q12_GA,
		Q12_HI, Q12_IA, Q12_ID, Q12_IL, Q12_IN, Q12_KS, Q12_KY, Q12_LA, Q12_MA, Q12_MD, Q12_ME,
		Q12_MI, Q12_MN, Q12_MO, Q12_MS, Q12_MT, Q12_NC, Q12_ND, Q12_NE, Q12_NH, Q12_NJ, Q12_NM,
		Q12_NV, Q12_NY, Q12_OH, Q12_OK, Q12_OR, Q12_PA, Q12_RI, Q12_SC, Q12_SD, Q12_TN, Q12_TX,
		Q12_UT, Q12_VA, Q12_VT, Q12_WA, Q12_WI, Q12_WV, Q12_WY, Q12_AS, Q12_GU, Q12_MP, Q12_VI, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'All States in which Registered Nurses were Currently Practicing';
PROC FREQ DATA = WORK.SORT71
	ORDER=INTERNAL;
	TABLES Q12_AK / SCORES=TABLE;
	TABLES Q12_AL / SCORES=TABLE;
	TABLES Q12_AR / SCORES=TABLE;
	TABLES Q12_AZ / SCORES=TABLE;
	TABLES Q12_CA / SCORES=TABLE;
	TABLES Q12_CO / SCORES=TABLE;
	TABLES Q12_CT / SCORES=TABLE;
	TABLES Q12_DC / SCORES=TABLE;
	TABLES Q12_DE / SCORES=TABLE;
	TABLES Q12_FL / SCORES=TABLE;
	TABLES Q12_GA / SCORES=TABLE;
	TABLES Q12_HI / SCORES=TABLE;
	TABLES Q12_IA / SCORES=TABLE;
	TABLES Q12_ID / SCORES=TABLE;
	TABLES Q12_IL / SCORES=TABLE;
	TABLES Q12_IN / SCORES=TABLE;
	TABLES Q12_KS / SCORES=TABLE;
	TABLES Q12_KY / SCORES=TABLE;
	TABLES Q12_LA / SCORES=TABLE;
	TABLES Q12_MA / SCORES=TABLE;
	TABLES Q12_MD / SCORES=TABLE;
	TABLES Q12_ME / SCORES=TABLE;
	TABLES Q12_MI / SCORES=TABLE;
	TABLES Q12_MN / SCORES=TABLE;
	TABLES Q12_MO / SCORES=TABLE;
	TABLES Q12_MS / SCORES=TABLE;
	TABLES Q12_MT / SCORES=TABLE;
	TABLES Q12_NC / SCORES=TABLE;
	TABLES Q12_ND / SCORES=TABLE;
	TABLES Q12_NE / SCORES=TABLE;
	TABLES Q12_NH / SCORES=TABLE;
	TABLES Q12_NJ / SCORES=TABLE;
	TABLES Q12_NM / SCORES=TABLE;
	TABLES Q12_NV / SCORES=TABLE;
	TABLES Q12_NY / SCORES=TABLE;
	TABLES Q12_OH / SCORES=TABLE;
	TABLES Q12_OK / SCORES=TABLE;
	TABLES Q12_OR / SCORES=TABLE;
	TABLES Q12_PA / SCORES=TABLE;
	TABLES Q12_RI / SCORES=TABLE;
	TABLES Q12_SC / SCORES=TABLE;
	TABLES Q12_SD / SCORES=TABLE;
	TABLES Q12_TN / SCORES=TABLE;
	TABLES Q12_TX / SCORES=TABLE;
	TABLES Q12_UT / SCORES=TABLE;
	TABLES Q12_VA / SCORES=TABLE;
	TABLES Q12_VT / SCORES=TABLE;
	TABLES Q12_WA / SCORES=TABLE;
	TABLES Q12_WI / SCORES=TABLE;
	TABLES Q12_WV / SCORES=TABLE;
	TABLES Q12_WY / SCORES=TABLE;
	TABLES Q12_AS / SCORES=TABLE;
	TABLES Q12_GU / SCORES=TABLE;
	TABLES Q12_MP / SCORES=TABLE;
	TABLES Q12_VI / SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;			

/* registered nurses practicing in multiple states */
	
PROC SQL;
	CREATE VIEW WORK.SORT72 AS
		SELECT Q12total, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Registered Nurses Practicing in Multiple States';
PROC FREQ DATA = WORK.SORT72
	ORDER=INTERNAL;
	TABLES Q12total / NOROW NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* employment status */

PROC SQL;
	CREATE VIEW WORK.SORT73 AS
		SELECT emp_in_nursing, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM, emp_outside_nursing, Q13_OTHER_FULLTIME, 
		Q13_OTHER_PARTTIME, Q13_OTHER_PERDIEM, Q13_NURSING_VOLUNTEER, Q13_UNEMPLOYED_SEEKING,
		Q13_UNEMPLOYED_NOT_SEEKING, Q13_RETIRED, emp_fullyoutside_nursing, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Employement Status';
PROC FREQ DATA = WORK.SORT73
	ORDER=INTERNAL;
	TABLES emp_in_nursing / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_FULLTIME / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_PARTTIME / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_PERDIEM / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES emp_outside_nursing / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_OTHER_FULLTIME / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_OTHER_PARTTIME / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_OTHER_PERDIEM / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_VOLUNTEER / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_UNEMPLOYED_SEEKING / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_UNEMPLOYED_NOT_SEEKING / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q13_RETIRED / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES emp_fullyoutside_nursing / NOROW NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* reasons for being unemployed */

PROC SQL;
	CREATE VIEW WORK.SORT74 AS
		SELECT Q14_FAMILY, Q14_DISABLED, Q14_SALARY, Q14_SCHOOL, Q14_DIFFICULT_FINDING, Q14_OTHER, Q14_SPECIFY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Reasons for Being Unemployed';
PROC FREQ DATA = WORK.SORT74
	ORDER=INTERNAL;
	TABLES Q14_FAMILY / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_DISABLED / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_SALARY / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_SCHOOL / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_DIFFICULT_FINDING / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_OTHER / NOROW NOCOL NOCUM SCORES=TABLE;
	TABLES Q14_SPECIFY / NOROW NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* initial nursing education, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT75 AS
		SELECT Q4_FIRSTDEGREE, emp_in_nursing, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM,
		emp_fullyoutside_nursing, Q13_UNEMPLOYED_SEEKING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Initial Nursing Education, by Employment Status';
PROC FREQ DATA = WORK.SORT75
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * emp_in_nursing / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * Q13_NURSING_FULLTIME / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * Q13_NURSING_PARTTIME / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * Q13_NURSING_PERDIEM / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * emp_fullyoutside_nursing / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q4_FIRSTDEGREE * Q13_UNEMPLOYED_SEEKING / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
	WEIGHT pct_wgtC;
RUN;
	
/* highest level of education, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT76 AS
		SELECT Q5_HIGHESTEDUCATION, emp_in_nursing, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q13_NURSING_PERDIEM,
		emp_fullyoutside_nursing, Q13_UNEMPLOYED_SEEKING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education, by Employment Status';
PROC FREQ DATA = WORK.SORT76
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * emp_in_nursing / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * Q13_NURSING_FULLTIME / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * Q13_NURSING_PARTTIME / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * Q13_NURSING_PERDIEM / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * emp_fullyoutside_nursing / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q5_HIGHESTEDUCATION * Q13_UNEMPLOYED_SEEKING / NOROW NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* number of positions currently employed as a nurse */

PROC SQL;
	CREATE VIEW WORK.SORT77 AS
		SELECT Q15_NUM_POSITIONS, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Number of Positions Currently Employed as a Nurse';
PROC FREQ DATA = WORK.SORT77
	ORDER=INTERNAL;
	TABLES Q15_NUM_POSITIONS / NOROW NOCUM SCORES=TABLE;
	FORMAT Q15_NUM_POSITIONS Q15_NUM_POSITIONS.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment status, by registered nurses holding multiple positions */

PROC SQL;
	CREATE VIEW WORK.SORT78 AS
		SELECT Q15_NUM_POSITIONS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Status, by Registered Nurses Holding Multiple Positions';
PROC FREQ DATA = WORK.SORT78
	ORDER=INTERNAL;
	TABLES Q13_NURSING_FULLTIME * Q15_NUM_POSITIONS / NOROW NOCUM SCORES=TABLE;
	TABLES Q13_NURSING_PARTTIME * Q15_NUM_POSITIONS / NOROW NOCUM SCORES=TABLE;
	FORMAT Q15_NUM_POSITIONS Q15_NUM_POSITIONS. Q13_NURSING_FULLTIME Q13_NURSING_FULLTIME. Q13_NURSING_PARTTIME Q13_NURSING_PARTTIME.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment setting */

PROC SQL;
	CREATE VIEW WORK.SORT79 AS
		SELECT Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting';
PROC FREQ DATA = WORK.SORT79
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* secondary employment setting */

PROC SQL;
	CREATE VIEW WORK.SORT80 AS
		SELECT Q25_SECONDARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Secondary Employment Setting';
PROC FREQ DATA = WORK.SORT80
	ORDER=INTERNAL;
	TABLES Q25_SECONDARY_SETTING / NOROW NOCUM SCORES=TABLE;
	FORMAT Q25_SECONDARY_SETTING Q25_SECONDARY_SETTING.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment setting, by highest level of education */

PROC SQL;
	CREATE VIEW WORK.SORT81 AS
		SELECT Q20_PRIMARY_SETTING, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT81
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q5_HIGHESTEDUCATION / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING. Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* primary position title */

PROC SQL;
	CREATE VIEW WORK.SORT82 AS
		SELECT Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT82
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE / NOROW NOCUM SCORES=TABLE;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* secondary position title */

PROC SQL;
	CREATE VIEW WORK.SORT83 AS
		SELECT Q26_SECONDARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Secondary Position Title';
PROC FREQ DATA = WORK.SORT83
	ORDER=INTERNAL;
	TABLES Q26_SECONDARY_TITLE / NOROW NOCUM SCORES=TABLE;
	FORMAT Q26_SECONDARY_TITLE Q26_SECONDARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* primary position title, by highest level of education */

PROC SQL;
	CREATE VIEW WORK.SORT84 AS
		SELECT Q21_PRIMARY_TITLE, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT84
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q5_HIGHESTEDUCATION / NOCOL NOPERCENT NOCUM SCORES=TABLE;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE. Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty */

PROC SQL;
	CREATE VIEW WORK.SORT85 AS
		SELECT Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Specialty';
PROC FREQ DATA = WORK.SORT85
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY / NOROW SCORES=TABLE;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* secondary employment specialty */

PROC SQL;
	CREATE VIEW WORK.SORT86 AS
		SELECT Q27_SECONDARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Secondary Employment Specialty';
PROC FREQ DATA = WORK.SORT86
	ORDER=INTERNAL;
	TABLES Q27_SECONDARY_SPECIALTY / NOROW SCORES=TABLE;
	FORMAT Q27_SECONDARY_SPECIALTY Q27_SECONDARY_SPECIALTY.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty for hospital and nonhospital employment settings */
		
PROC SQL;
	CREATE VIEW WORK.SORT87 AS
		SELECT Q22_PRIMARY_SPECIALTY, HospitalVsOther, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Secondary Employment Specialty';
PROC FREQ DATA = WORK.SORT87
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * HospitalVsOther / NOROW NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY. HospitalVsOther HospitalVsOther.;
	WEIGHT pct_wgtC;
RUN;

/* primary employment specialty, by highest level of education */

PROC SQL;
	CREATE VIEW WORK.SORT88 AS
		SELECT Q22_PRIMARY_SPECIALTY, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT88
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * Q5_HIGHESTEDUCATION / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY. Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* specialty settings */

PROC SQL;
	CREATE VIEW WORK.SORT89 AS
		SELECT Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC,
		Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting';
PROC FREQ DATA = WORK.SORT89
	ORDER=INTERNAL;
	TABLES Q17A_CAMP / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/* specialty setting, by highest level of education */

PROC SQL;
	CREATE VIEW WORK.SORT90 AS
		SELECT Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC,
		Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Specialty Setting, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT90
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * Q5_HIGHESTEDUCATION / NOCUM NOCOL NOPERCENT SCORES=TABLE;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
	WEIGHT pct_wgtC;
RUN;

/* average hours worked per week in nursing positions */

Title 'Average Hours Worked per Week in Nursing Positions';
PROC MEANS DATA=WORK.analyses FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		WEIGHT pct_wgtC;
RUN;

/* average hours worked per week in nursing positions, by number of nursing positions */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q16_HOURS Q15_NUM_POSITIONS pct_wgtC)
	OUT=WORK.meanSORT91;
	BY Q15_NUM_POSITIONS;
RUN;

Title 'Average Hours Worked Per Week in Nursing Positions, by Number of Nursing Positions';
PROC MEANS DATA=WORK.meanSORT91 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q15_NUM_POSITIONS;
		FORMAT Q15_NUM_POSITIONS Q15_NUM_POSITIONS.;
		WEIGHT pct_wgtC;
RUN;

/* average hours worked per week in nursing positions, by age */
						
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q16_HOURS Agegroup pct_wgtC)
	OUT=WORK.meanSORT92;
	BY Agegroup;
RUN;

Title 'Average Hours Worked Per Week in Nursing Positions, by Age';
PROC MEANS DATA=WORK.meanSORT92 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Agegroup;
		WEIGHT pct_wgtC;
RUN;

/* average hours worked per week in nursing positions, by highest level of education */
					
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q16_HOURS Q5_HIGHESTEDUCATION pct_wgtC)
	OUT=WORK.meanSORT93;
	BY Q5_HIGHESTEDUCATION;
RUN;

Title 'Average Hours Worked per Week in Nursing Positions, by Highest Level of Education';
PROC MEANS DATA=WORK.meanSORT93 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q5_HIGHESTEDUCATION;
		FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
		WEIGHT pct_wgtC;
RUN;

/* average hours per week in primary employment setting, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT94 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_FULLTIME = 1;
QUIT;
	
PROC SORT
	DATA = WORK.SORT94(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME Q20_PRIMARY_SETTING pct_wgtC)
	OUT=WORK.meanSORT95;
	BY Q20_PRIMARY_SETTING;
RUN;

Title 'Average Hours Worked per Week in Primary Employment Setting, by Employment Status -- fulltime';
PROC MEANS DATA=WORK.meanSORT95 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q20_PRIMARY_SETTING;
		FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
		WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT96 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_PARTTIME = 1;
QUIT;
	
PROC SORT
	DATA = WORK.SORT96(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME Q20_PRIMARY_SETTING pct_wgtC)
	OUT=WORK.meanSORT97;
	BY Q20_PRIMARY_SETTING;
RUN;

Title 'Average Hours Worked per Week in Primary Employment Setting, by Employment Status -- parttime';
PROC MEANS DATA=WORK.meanSORT97 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q20_PRIMARY_SETTING;
		FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
		WEIGHT pct_wgtC;
RUN;

/* average hours per week in primary position title, by employment status */

PROC SQL;
	CREATE VIEW WORK.SORT98 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q20_PRIMARY_SETTING, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_FULLTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.SORT98(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME Q20_PRIMARY_SETTING Q21_PRIMARY_TITLE pct_wgtC)
	OUT=WORK.meanSORT99;
	BY Q21_PRIMARY_TITLE;
RUN;

Title 'Average Hours Worked per Week in Primary Position Title, by Employment Status -- fulltime';
PROC MEANS DATA=WORK.meanSORT99 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q21_PRIMARY_TITLE;
		FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
		WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT100 AS
		SELECT Q16_HOURS, Q13_NURSING_FULLTIME, Q13_NURSING_PARTTIME, Q20_PRIMARY_SETTING, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses
	WHERE Q13_NURSING_PARTTIME = 1;
QUIT;

PROC SORT
	DATA = WORK.SORT100(KEEP = Q16_HOURS Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME Q20_PRIMARY_SETTING Q21_PRIMARY_TITLE pct_wgtC)
	OUT=WORK.meanSORT101;
	BY Q21_PRIMARY_TITLE;
RUN;

Title 'Average Hours Worked per Week in Primary Position Title, by Employment Status -- parttime';
PROC MEANS DATA=WORK.meanSORT101 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY Q21_PRIMARY_TITLE;
		FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
		WEIGHT pct_wgtC;
RUN;

/***********************************************************/

/************************** SALARY *************************/

/***********************************************************/

/* 2014 pre-tax annual earnings from primary nursing position */


Title '2014 Pre-tax Annual Earnings from Primary Nursing Position';
PROC MEANS DATA=WORK.ANALYSES FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
	VAR Q19_PRIMARY_SALARY;	
	WEIGHT pct_wgtC;
RUN;

/* 2014 pre-tax annual earnings from secondary nursing position */

Title '2014 Pre-tax Annual Earnings from Secondary Nursing Position';
PROC MEANS DATA=WORK.ANALYSES FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q24_SECONDARY_SALARY;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by age */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC Agegroup pct_wgtC)
	OUT=WORK.meanSORT102;
	BY Agegroup;
RUN;

Title 'Average Salary in Primary Nursing Position, by Age';
PROC MEANS DATA=WORK.meanSORT102 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Agegroup;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by year licensed */	
	
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC YrLicCohort pct_wgtC)
	OUT=WORK.meanSORT103;
	BY YrLicCohort;
RUN;

Title 'Average Salary in Primary Nursing Position, by Age';
PROC MEANS DATA=WORK.meanSORT103 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY YrLicCohort;
		FORMAT YrLicCohort YrLicCohort.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by gender */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC Q1_GENDER pct_wgtC)
	OUT=WORK.meanSORT104;
	BY Q1_GENDER;
RUN;

Title 'Average Salary in Primary Nursing Position, by Gender';
PROC MEANS DATA=WORK.meanSORT104 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q1_GENDER;
		FORMAT Q1_GENDER Q1_GENDER.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by race/ethnicity */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT105;
	BY NATIVE;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- NATIVE';
PROC MEANS DATA=WORK.meanSORT105 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY NATIVE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT106;
	BY ASIAN;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- ASIAN';
PROC MEANS DATA=WORK.meanSORT106 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY ASIAN;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT107;
	BY BLACK;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- BLACK';
PROC MEANS DATA=WORK.meanSORT107 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY BLACK;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT108;
	BY PACIFICISLANDER;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- PACIFICISLANDER';
PROC MEANS DATA=WORK.meanSORT108 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY PACIFICISLANDER;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT109;
	BY WHITE;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- WHITE';
PROC MEANS DATA=WORK.meanSORT109 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY WHITE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT110;
	BY HISPANIC;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- HISPANIC';
PROC MEANS DATA=WORK.meanSORT110 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY HISPANIC;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT111;
	BY OTHER;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- OTHER';
PROC MEANS DATA=WORK.meanSORT111 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY OTHER;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY NATIVE ASIAN BLACK PACIFICISLANDER 
	WHITE HISPANIC OTHER MIXED_RACE pct_wgtC)
	OUT=WORK.meanSORT112;
	BY MIXED_RACE;
RUN;

Title 'Average Salary in Primary Nursing Position, by Race/Ethnicity -- MIXED_RACE';
PROC MEANS DATA=WORK.meanSORT112 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY MIXED_RACE;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by initial nursing education */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC Q4_FIRSTDEGREE pct_wgtC)
	OUT=WORK.meanSORT113;
	BY Q4_FIRSTDEGREE;
RUN;

Title 'Average Salary in Primary Nursing Position, by Initial Nursing Education';
PROC MEANS DATA=WORK.meanSORT113 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q4_FIRSTDEGREE;
		FORMAT Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by highest level of education */
	
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q8_YEAR_INITIAL_LIC Q5_HIGHESTEDUCATION pct_wgtC)
	OUT=WORK.meanSORT114;
	BY Q5_HIGHESTEDUCATION;
RUN;

Title 'Average Salary in Primary Nursing Position, by Highest Level of Education';
PROC MEANS DATA=WORK.meanSORT114 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q5_HIGHESTEDUCATION;
		FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by advanced practice registered nurse certification/licensure */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q7_NP Q7_CNS Q7_CRNA Q7_CNM Q7_NONE pct_wgtC)
	OUT=WORK.meanSORT115;
	BY Q7_NP;
RUN;

Title 'Average Salary in Primary Nursing Position, by Highest Level of Education -- NP';
PROC MEANS DATA=WORK.meanSORT115 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q7_NP;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q7_NP Q7_CNS Q7_CRNA Q7_CNM Q7_NONE pct_wgtC)
	OUT=WORK.meanSORT116;
	BY Q7_CNS;
RUN;

Title 'Average Salary in Primary Nursing Position, by Highest Level of Education -- CNS';
PROC MEANS DATA=WORK.meanSORT116 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q7_CNS;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q7_NP Q7_CNS Q7_CRNA Q7_CNM Q7_NONE pct_wgtC)
	OUT=WORK.meanSORT117;
	BY Q7_CRNA;
RUN;

Title 'Average Salary in Primary Nursing Position, by Highest Level of Education -- CNRA';
PROC MEANS DATA=WORK.meanSORT117 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q7_CRNA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q7_NP Q7_CNS Q7_CRNA Q7_CNM Q7_NONE pct_wgtC)
	OUT=WORK.meanSORT118;
	BY Q7_CNM;
RUN;

Title 'Average Salary in Primary Nursing Position, by Highest Level of Education -- CNM';
PROC MEANS DATA=WORK.meanSORT118 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q7_CNM;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by state */					

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT119;
	BY Q12_AK;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- AK';
PROC MEANS DATA=WORK.meanSORT119 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_AK;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT120;
	BY Q12_AL;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- AL';
PROC MEANS DATA=WORK.meanSORT120 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_AL;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT121;
	BY Q12_AR;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- AR';
PROC MEANS DATA=WORK.meanSORT121 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_AR;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT122;
	BY Q12_AZ;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- AZ';
PROC MEANS DATA=WORK.meanSORT122 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_AZ;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT123;
	BY Q12_CA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- CA';
PROC MEANS DATA=WORK.meanSORT123 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_CA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT124;
	BY Q12_CO;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- CO';
PROC MEANS DATA=WORK.meanSORT124 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_CO;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT125;
	BY Q12_CT;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- CT';
PROC MEANS DATA=WORK.meanSORT125 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_CT;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT126;
	BY Q12_DC;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- DC';
PROC MEANS DATA=WORK.meanSORT126 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_DC;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT127;
	BY Q12_DE;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- DE';
PROC MEANS DATA=WORK.meanSORT127 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_DE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT128;
	BY Q12_FL;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- FL';
PROC MEANS DATA=WORK.meanSORT128 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_FL;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT129;
	BY Q12_GA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- GA';
PROC MEANS DATA=WORK.meanSORT129 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_GA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT130;
	BY Q12_HI;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- HI';
PROC MEANS DATA=WORK.meanSORT130 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_HI;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT131;
	BY Q12_IA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- IA';
PROC MEANS DATA=WORK.meanSORT131 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_IA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT132;
	BY Q12_ID;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- ID';
PROC MEANS DATA=WORK.meanSORT132 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_ID;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT133;
	BY Q12_IL;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- IL';
PROC MEANS DATA=WORK.meanSORT133 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_IL;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT134;
	BY Q12_IN;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- IN';
PROC MEANS DATA=WORK.meanSORT134 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_IN;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT135;
	BY Q12_KS;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- KS';
PROC MEANS DATA=WORK.meanSORT135 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_KS;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT136;
	BY Q12_KY;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- KY';
PROC MEANS DATA=WORK.meanSORT136 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_KY;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT137;
	BY Q12_LA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- LA';
PROC MEANS DATA=WORK.meanSORT137 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_LA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT138;
	BY Q12_MA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MA';
PROC MEANS DATA=WORK.meanSORT138 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT139;
	BY Q12_MD;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MD';
PROC MEANS DATA=WORK.meanSORT139 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MD;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT140;
	BY Q12_ME;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- ME';
PROC MEANS DATA=WORK.meanSORT140 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_ME;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT141;
	BY Q12_MI;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MI';
PROC MEANS DATA=WORK.meanSORT141 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MI;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT142;
	BY Q12_MN;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MN';
PROC MEANS DATA=WORK.meanSORT142 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MN;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT143;
	BY Q12_MO;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MO';
PROC MEANS DATA=WORK.meanSORT143 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MO;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT144;
	BY Q12_MS;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MS';
PROC MEANS DATA=WORK.meanSORT144 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MS;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT145;
	BY Q12_MT;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MT';
PROC MEANS DATA=WORK.meanSORT145 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MT;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT146;
	BY Q12_NC;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NC';
PROC MEANS DATA=WORK.meanSORT146 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NC;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT147;
	BY Q12_ND;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- ND';
PROC MEANS DATA=WORK.meanSORT147 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_ND;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT148;
	BY Q12_NE;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NE';
PROC MEANS DATA=WORK.meanSORT148 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NE;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT149;
	BY Q12_NH;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NH';
PROC MEANS DATA=WORK.meanSORT149 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NH;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT150;
	BY Q12_NJ;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NJ';
PROC MEANS DATA=WORK.meanSORT150 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NJ;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT151;
	BY Q12_NM;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NM';
PROC MEANS DATA=WORK.meanSORT151 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NM;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT152;
	BY Q12_NV;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NV';
PROC MEANS DATA=WORK.meanSORT152 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NV;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT153;
	BY Q12_NY;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- NY';
PROC MEANS DATA=WORK.meanSORT153 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_NY;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT154;
	BY Q12_OH;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- OH';
PROC MEANS DATA=WORK.meanSORT154 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_OH;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT155;
	BY Q12_OK;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- OK';
PROC MEANS DATA=WORK.meanSORT155 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_OK;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT156;
	BY Q12_OR;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- OR';
PROC MEANS DATA=WORK.meanSORT156 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_OR;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT157;
	BY Q12_PA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- PA';
PROC MEANS DATA=WORK.meanSORT157 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_PA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT158;
	BY Q12_RI;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- RI';
PROC MEANS DATA=WORK.meanSORT158 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_RI;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT159;
	BY Q12_SC;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- SC';
PROC MEANS DATA=WORK.meanSORT159 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_SC;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT160;
	BY Q12_SD;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- SD';
PROC MEANS DATA=WORK.meanSORT160 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_SD;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT161;
	BY Q12_TN;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- TN';
PROC MEANS DATA=WORK.meanSORT161 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_TN;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT162;
	BY Q12_TX;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- TX';
PROC MEANS DATA=WORK.meanSORT162 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_TX;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT163;
	BY Q12_UT;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- UT';
PROC MEANS DATA=WORK.meanSORT163 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_UT;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT164;
	BY Q12_VA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- VA';
PROC MEANS DATA=WORK.meanSORT164 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_VA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT165;
	BY Q12_VT;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- VT';
PROC MEANS DATA=WORK.meanSORT165 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_VT;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT166;
	BY Q12_WA;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- WA';
PROC MEANS DATA=WORK.meanSORT166 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_WA;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT167;
	BY Q12_WI;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- WI';
PROC MEANS DATA=WORK.meanSORT167 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_WI;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT168;
	BY Q12_WV;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- WV';
PROC MEANS DATA=WORK.meanSORT168 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_WV;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT169;
	BY Q12_WY;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- WY';
PROC MEANS DATA=WORK.meanSORT169 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_WY;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT170;
	BY Q12_AS;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- AS';
PROC MEANS DATA=WORK.meanSORT170 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_AS;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT171;
	BY Q12_GU;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- GU';
PROC MEANS DATA=WORK.meanSORT171 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_GU;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT172;
	BY Q12_MP;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- MP';
PROC MEANS DATA=WORK.meanSORT172 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_MP;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q12_AK Q12_AL Q12_AR Q12_AZ Q12_CA Q12_CO Q12_CT Q12_DC 
	Q12_DE Q12_FL Q12_GA Q12_HI Q12_IA Q12_ID Q12_IL Q12_IN Q12_KS Q12_KY Q12_LA Q12_MA Q12_MD Q12_ME
	Q12_MI Q12_MN Q12_MO Q12_MS Q12_MT Q12_NC Q12_ND Q12_NE Q12_NH Q12_NJ Q12_NM
	Q12_NV Q12_NY Q12_OH Q12_OK Q12_OR Q12_PA Q12_RI Q12_SC Q12_SD Q12_TN Q12_TX
	Q12_UT Q12_VA Q12_VT Q12_WA Q12_WI Q12_WV Q12_WY Q12_AS Q12_GU Q12_MP Q12_VI pct_wgtC)
	OUT=WORK.meanSORT173;
	BY Q12_VI;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- VI';
PROC MEANS DATA=WORK.meanSORT173 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q12_VI;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by employment status */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT174;
	BY emp_in_nursing;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- employed in nursing overall';
PROC MEANS DATA=WORK.meanSORT174 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY emp_in_nursing;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT175;
	BY Q13_NURSING_FULLTIME;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- nursing full time';
PROC MEANS DATA=WORK.meanSORT175 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q13_NURSING_FULLTIME;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT176;
	BY Q13_NURSING_PARTTIME;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- nursing part time';
PROC MEANS DATA=WORK.meanSORT176 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q13_NURSING_PARTTIME;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT177;
	BY Q13_NURSING_PERDIEM;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- nursing per diem';
PROC MEANS DATA=WORK.meanSORT177 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q13_NURSING_PERDIEM;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT178;
	BY emp_fullyoutside_nursing;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- employed in otherfield overall';
PROC MEANS DATA=WORK.meanSORT178 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY emp_fullyoutside_nursing;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT179;
	BY emp_fullyoutside_nursing_full;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- employed in otherfield full time';
PROC MEANS DATA=WORK.meanSORT179 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY emp_fullyoutside_nursing_full;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT180;
	BY emp_fullyoutside_nursing_part;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- employed in otherfield part time';
PROC MEANS DATA=WORK.meanSORT180 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY emp_fullyoutside_nursing_part;
		WEIGHT pct_wgtC;
RUN;

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY emp_in_nursing Q13_NURSING_FULLTIME Q13_NURSING_PARTTIME
	Q13_NURSING_PERDIEM emp_fullyoutside_nursing emp_fullyoutside_nursing_full emp_fullyoutside_nursing_part
	emp_fullyoutside_nursing_diem pct_wgtC)
	OUT=WORK.meanSORT181;
	BY emp_fullyoutside_nursing_diem;
RUN;

Title 'Average Salary in Primary Nursing Position, by State -- employed in otherfield per diem';
PROC MEANS DATA=WORK.meanSORT181 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY emp_fullyoutside_nursing_diem;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by primary employment setting */
						
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q20_PRIMARY_SETTING pct_wgtC)
	OUT=WORK.meanSORT182;
	BY Q20_PRIMARY_SETTING;
RUN;

Title 'Average Salary in Primary Nursing Position, by Primary Employment Setting';
PROC MEANS DATA=WORK.meanSORT182 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q20_PRIMARY_SETTING;
		FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by primary position title */
					
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q21_PRIMARY_TITLE pct_wgtC)
	OUT=WORK.meanSORT183;
	BY Q21_PRIMARY_TITLE;
RUN;

Title 'Average Salary in Primary Nursing Position, by Primary Employment Setting';
PROC MEANS DATA=WORK.meanSORT183 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q21_PRIMARY_TITLE;
		FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
		WEIGHT pct_wgtC;
RUN;

/* average salary in primary nursing position, by primary employment specialty */
						
PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q19_PRIMARY_SALARY Q22_PRIMARY_SPECIALTY pct_wgtC)
	OUT=WORK.meanSORT184;
	BY Q22_PRIMARY_SPECIALTY;
RUN;

Title 'Average Salary in Primary Nursing Position, by Primary Employment Specialty';
PROC MEANS DATA=WORK.meanSORT184 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q19_PRIMARY_SALARY;
		BY Q22_PRIMARY_SPECIALTY;
		FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
		WEIGHT pct_wgtC;
RUN;

/***********************************************************/

/********************* NURSE FACULTY ***********************/

/***********************************************************/

/* age distribution of registered nurses with "nurse faculty" as primary or secondary position title */
		
PROC SQL;
	CREATE VIEW WORK.SORT185 AS
		SELECT Q21_PRIMARY_TITLE, AgeGroup, pct_wgtC
	FROM WORK.analyses
	WHERE Q21_PRIMARY_TITLE = 6;
QUIT;

Title 'Age Distribution of Registered Nurses with "Nurse Faculty" as Primary or Secondary Position Title -- primary';
PROC FREQ DATA = WORK.SORT185
	ORDER=INTERNAL;
	TABLES AgeGroup / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE. AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.St185 AS
		SELECT Q26_SECONDARY_TITLE, AgeGroup, pct_wgtC
	FROM WORK.analyses
	WHERE Q26_SECONDARY_TITLE = 7;
QUIT;

Title 'Age Distribution of Registered Nurses with "Nurse Faculty" as Primary or Secondary Position Title -- secondary';
PROC FREQ DATA = WORK.St185
	ORDER=INTERNAL;
	TABLES AgeGroup / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT Q26_SECONDARY_TITLE Q26_SECONDARY_TITLE. AgeGroup AgeGroup.;
	WEIGHT pct_wgtC;
RUN;

/* registered nurses employed as faculty in a secondary position title, by primary position title */
	
PROC SQL;
	CREATE VIEW WORK.SORT186 AS
		SELECT Q21_PRIMARY_TITLE, Q26_SECONDARY_TITLE, AgeGroup, pct_wgtC
	FROM WORK.analyses
	WHERE Q21_PRIMARY_TITLE = 6 OR Q26_SECONDARY_TITLE = 7;
QUIT;

Title 'Registered Nurses Employed as Faculty in a Secondary Position Title, by Primary Position Title';
PROC FREQ DATA = WORK.SORT186
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q26_SECONDARY_TITLE / NOROW NOCOL NOCUM SCORES=TABLE;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE. Q26_SECONDARY_TITLE Q26_SECONDARY_TITLE.;
	WEIGHT pct_wgtC;
RUN;

/* hours worked per week, by registered nurses with nurse faculty as primary or secondary position title */

PROC SQL;
	CREATE VIEW WORK.SORT187 AS
		SELECT Q21_PRIMARY_TITLE, Q16_HOURS, pct_wgtC
	FROM WORK.analyses
	WHERE Q21_PRIMARY_TITLE = 6;
QUIT;

Title 'Hours Worked per Week, by Registered Nurses with Nurse Faculty as Primary or Secondary Position Title -- primary';
PROC FREQ DATA = WORK.SORT187
	ORDER=INTERNAL;
	TABLES Q16_HOURS / NOROW NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

PROC SQL;
	CREATE VIEW WORK.St187 AS
		SELECT Q26_SECONDARY_TITLE, Q16_HOURS, pct_wgtC
	FROM WORK.analyses
	WHERE Q26_SECONDARY_TITLE = 7;
QUIT;

Title 'Hours Worked per Week, by Registered Nurses with Nurse Faculty as Primary or Secondary Position Title -- secondary';
PROC FREQ DATA = WORK.St187
	ORDER=INTERNAL;
	TABLES Q16_HOURS / NOROW NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

/***********************************************************/

/************************ APRNs ***************************/

/***********************************************************/

/* age distribution of nurse practitioners */

PROC SQL;
	CREATE VIEW WORK.SORT188 AS
		SELECT Q7_NP, AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age Distribution of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT188
	ORDER=INTERNAL;
	TABLES Q7_NP * AgeGroup / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT AgeGroup AgeGroup.;
RUN;

/* highest level of education of Nurse Practitioners */
	
PROC SQL;
	CREATE VIEW WORK.SORT189 AS
		SELECT Q7_NP, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT189
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
RUN;

/* primary employment setting of nurse practitioners */
		
PROC SQL;
	CREATE VIEW WORK.SORT190 AS
		SELECT Q7_NP, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT190
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;

/* primary position titles of nurse practitioners */
		
PROC SQL;
	CREATE VIEW WORK.SORT191 AS
		SELECT Q7_NP, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Titles of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT191
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
RUN;

/* primary employment specialty of nurse practitioners */

PROC SQL;
	CREATE VIEW WORK.SORT192 AS
		SELECT Q7_NP, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Titles of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT192
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
RUN;

/* nurse practitioners whose primary employment specialty is primary care, by primary position title */
	
PROC SQL;
	CREATE VIEW WORK.SORT193 AS
		SELECT Q7_NP, Q22_PRIMARY_SPECIALTY, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses
	WHERE Q22_PRIMARY_SPECIALTY = 21;
QUIT;

Title 'Primary Position Titles of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT193
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
RUN;

/* nurse practitioners whose primary employment specialty is primary care, by primary employment setting */
		
PROC SQL;
	CREATE VIEW WORK.SORT194 AS
		SELECT Q7_NP, Q22_PRIMARY_SPECIALTY, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses
	WHERE Q22_PRIMARY_SPECIALTY = 21;
QUIT;

Title 'Primary Position Titles of Nurse Practitioners';
PROC FREQ DATA = WORK.SORT194
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q7_NP / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;

/* age distribution of nurse midwives */
									
PROC SQL;
	CREATE VIEW WORK.SORT195 AS
		SELECT Q7_CNM, AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age Distribution of nurse midwives';
PROC FREQ DATA = WORK.SORT195
	ORDER=INTERNAL;
	TABLES Q7_CNM * AgeGroup / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT AgeGroup AgeGroup.;
RUN;

/* highest level of education of nurse midwives */
		
PROC SQL;
	CREATE VIEW WORK.SORT196 AS
		SELECT Q7_CNM, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education of Nurse Midwives';
PROC FREQ DATA = WORK.SORT196
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q7_CNM / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
RUN;

/* primary employment setting of nurse midwives */

PROC SQL;
	CREATE VIEW WORK.SORT197 AS
		SELECT Q7_CNM, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting of Nurse Midwives';
PROC FREQ DATA = WORK.SORT197
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q7_CNM / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;

/* primary position titles of nurse midwives */
	
PROC SQL;
	CREATE VIEW WORK.SORT198 AS
		SELECT Q7_CNM, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Titles of Nurse Midwives';
PROC FREQ DATA = WORK.SORT198
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q7_CNM / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
RUN;

/* primary employment specialties of nurse midwives */

PROC SQL;
	CREATE VIEW WORK.SORT199 AS
		SELECT Q7_CNM, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Specialites of Nurse Midwives';
PROC FREQ DATA = WORK.SORT199
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * Q7_CNM / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
RUN;

/* age distribution of certified registered nurse anesthetists */

PROC SQL;
	CREATE VIEW WORK.SORT200 AS
		SELECT Q7_CRNA, AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age Distribution of Certified Registered Nurse Anesthetists';
PROC FREQ DATA = WORK.SORT200
	ORDER=INTERNAL;
	TABLES Q7_CRNA * AgeGroup / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT AgeGroup AgeGroup.;
RUN;	

/* highest level of education of certified registered nurse anesthetists */
		
PROC SQL;
	CREATE VIEW WORK.SORT201 AS
		SELECT Q7_CRNA, Q5_HIGHESTEDUCATION, Q7_CNM, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education of Certified Registered Nurse Anesthetists';
PROC FREQ DATA = WORK.SORT201
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q7_CNM / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
RUN;

/* primary employment setting of certified registered nurse anesthetists */

PROC SQL;
	CREATE VIEW WORK.SORT202 AS
		SELECT Q7_CRNA, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting of Certified Registered Nurse Anesthetists';
PROC FREQ DATA = WORK.SORT202
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q7_CRNA / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;	

/* age distribution of clinical nurse specialtists */

PROC SQL;
	CREATE VIEW WORK.SORT203 AS
		SELECT Q7_CNS, AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Age Distribution of Clinical Nurse Specialists';
PROC FREQ DATA = WORK.SORT203
	ORDER=INTERNAL;
	TABLES Q7_CNS * AgeGroup / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT AgeGroup AgeGroup.;
RUN;

/* highest level of education of clinical nurse specialists */

PROC SQL;
	CREATE VIEW WORK.SORT204 AS
		SELECT Q7_CNS, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Highest Level of Education of Clinical Nurse Specialits';
PROC FREQ DATA = WORK.SORT204
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * Q7_CNS / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
RUN;

/* primary employment setting of clinical nurse specialists */

PROC SQL;
	CREATE VIEW WORK.SORT205 AS
		SELECT Q7_CNS, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Setting of Clinical Nurse Specialits';
PROC FREQ DATA = WORK.SORT205
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * Q7_CNS / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;

/* primary position titles of clinical nurse specialists */

PROC SQL;
	CREATE VIEW WORK.SORT206 AS
		SELECT Q7_CNS, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Position Titles of Clinical Nurse Specialists';
PROC FREQ DATA = WORK.SORT206
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * Q7_CNS / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
RUN;

/* primary employment specialty of clinical nurse specialists */

PROC SQL;
	CREATE VIEW WORK.SORT207 AS
		SELECT Q7_CNS, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Primary Employment Specialty of Nurse Midwives';
PROC FREQ DATA = WORK.SORT207
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * Q7_CNS / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
RUN;

/******************************************************************/

/******************* FOREIGN-EDUCATED NURSES **********************/

/******************************************************************/
										
PROC SQL;
	CREATE VIEW WORK.SORT208 AS
		SELECT USvsForeignEd, AgeGroup, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Foreign-educated Status, by Age';
PROC FREQ DATA = WORK.SORT208
	ORDER=INTERNAL;
	TABLES USvsForeignEd * AgeGroup / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd.;
RUN;

/* foreign-educated status, by gender */

PROC SQL;
	CREATE VIEW WORK.SORT209 AS
		SELECT USvsForeignEd, Q1_GENDER, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Foreign-educated Status, by Gender';
PROC FREQ DATA = WORK.SORT209
	ORDER=INTERNAL;
	TABLES Q1_GENDER * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q1_GENDER Q1_GENDER.;
RUN;

/* year licensed and foreign-educated status, by initial nursing education */

PROC SQL;
	CREATE VIEW WORK.SORT210 AS
		SELECT USvsForeignEd, YrLicCohort, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses
	WHERE USvsForeignEd = 1;
QUIT;

Title 'Year Licensed and Foreign-educated Status, by Initial Nursing Education -- US Educated';
PROC FREQ DATA = WORK.SORT210
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * YrLicCohort  / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. YrLicCohort YrLicCohort. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
RUN;

PROC SQL;
	CREATE VIEW WORK.SORT211 AS
		SELECT USvsForeignEd, YrLicCohort, Q4_FIRSTDEGREE, pct_wgtC
	FROM WORK.analyses
	WHERE USvsForeignEd = 2;
QUIT;

Title 'Year Licensed and Foreign-educated Status, by Initial Nursing Education -- Foreign Educated';
PROC FREQ DATA = WORK.SORT211
	ORDER=INTERNAL;
	TABLES Q4_FIRSTDEGREE * YrLicCohort / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. YrLicCohort YrLicCohort. Q4_FIRSTDEGREE Q4_FIRSTDEGREE.;
RUN;

/* foreign-educated status, by highest level of education */
		
PROC SQL;
	CREATE VIEW WORK.SORT212 AS
		SELECT USvsForeignEd, Q5_HIGHESTEDUCATION, pct_wgtC
	FROM WORK.analyses;
QUIT;

Title 'Foreign-educated Status, by Highest Level of Education';
PROC FREQ DATA = WORK.SORT212
	ORDER=INTERNAL;
	TABLES Q5_HIGHESTEDUCATION * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q5_HIGHESTEDUCATION Q5_HIGHESTEDUCATION.;
RUN;

/* all states in which respondents had an active license to practice as an RN, by foreign-educated status */

PROC SQL;
	CREATE VIEW WORK.SORT213 AS
		SELECT USvsForeignEd, Q11_AK, Q11_AL, Q11_AR, Q11_AZ, Q11_CA, Q11_CO, Q11_CT, Q11_DC, Q11_DE, Q11_FL, Q11_GA, 
		Q11_HI, Q11_IA, Q11_ID, Q11_IL, Q11_IN, Q11_KS, Q11_KY, Q11_LA, Q11_MA, Q11_MD, Q11_ME,
		Q11_MI, Q11_MN, Q11_MO, Q11_MS, Q11_MT, Q11_NC, Q11_ND, Q11_NE, Q11_NH, Q11_NJ, Q11_NM,
		Q11_NV, Q11_NY, Q11_OH, Q11_OK, Q11_OR, Q11_PA, Q11_RI, Q11_SC, Q11_SD, Q11_TN, Q11_TX,
		Q11_UT, Q11_VA, Q11_VT, Q11_WA, Q11_WI, Q11_WV, Q11_WY, Q11_AS, Q11_GU, Q11_MP, Q11_VI, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'All States in Which Respondents had an Active License to Practice as an RN, by Foreign-educated Status';
PROC FREQ DATA = WORK.SORT213
	ORDER=INTERNAL;
	TABLES Q11_AK * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_AL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_AR * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_AZ * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_CA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_CO * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_CT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_DC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_DE * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_FL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_GA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_HI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_IA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_ID * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_IL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_IN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_KS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_KY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_LA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MD * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_ME * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MO * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_ND * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NE * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NH * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NJ * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NM * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NV * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_NY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_OH * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_OK * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_OR * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_PA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_RI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_SC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_SD * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_TN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_TX * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_UT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_VA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_VT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_WA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_WI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_WV * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_WY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_AS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_GU * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_MP * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q11_VI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd.;
RUN;

/* all states in which respondents were currently practicing, by foreign-educated status */

PROC SQL;
	CREATE VIEW WORK.SORT214 AS
		SELECT USvsForeignEd, Q12_AK, Q12_AL, Q12_AR, Q12_AZ, Q12_CA, Q12_CO, Q12_CT, Q12_DC, Q12_DE, Q12_FL, Q12_GA,
		Q12_HI, Q12_IA, Q12_ID, Q12_IL, Q12_IN, Q12_KS, Q12_KY, Q12_LA, Q12_MA, Q12_MD, Q12_ME,
		Q12_MI, Q12_MN, Q12_MO, Q12_MS, Q12_MT, Q12_NC, Q12_ND, Q12_NE, Q12_NH, Q12_NJ, Q12_NM,
		Q12_NV, Q12_NY, Q12_OH, Q12_OK, Q12_OR, Q12_PA, Q12_RI, Q12_SC, Q12_SD, Q12_TN, Q12_TX,
		Q12_UT, Q12_VA, Q12_VT, Q12_WA, Q12_WI, Q12_WV, Q12_WY, Q12_AS, Q12_GU, Q12_MP, Q12_VI, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'All States in which Respondents were Currently Practicing, by Foreign-educated Status';
PROC FREQ DATA = WORK.SORT214
	ORDER=INTERNAL;
	TABLES Q12_AK * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_AL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_AR * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_AZ * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_CA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_CO * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_CT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_DC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_DE * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_FL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_GA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_HI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_IA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_ID * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_IL * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_IN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_KS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_KY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_LA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MD * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_ME * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MO * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_ND * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NE * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NH * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NJ * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NM * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NV * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_NY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_OH * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_OK * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_OR * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_PA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_RI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_SC * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_SD * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_TN * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_TX * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_UT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_VA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_VT * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_WA * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_WI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_WV * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_WY * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_AS * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_GU * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_MP * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q12_VI * USvsForeignEd / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd.;
RUN;			

/* foreign-educated status, by number of licenses */

PROC SQL;
	CREATE VIEW WORK.SORT215 AS
		SELECT USvsForeignEd, Q12total, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Number of Licenses';
PROC FREQ DATA = WORK.SORT215
	ORDER=INTERNAL;
	TABLES Q12total * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd.;
RUN;			

/* hours worked during a typical week in all nursing positions, by foreign-educated status */

PROC SORT
	DATA = WORK.ANALYSES(KEEP = Q16_HOURS USvsForeignEd pct_wgtC)
	OUT=WORK.meanSORT216;
	BY USvsForeignEd;
RUN;

Title 'Hours Worked During a Typical Week in all Nursing Positions, by Foreign-educated Status';
PROC MEANS DATA=WORK.meanSORT216 FW=12 PRINTALLTYPES CHARTYPE MAXDEC=2 VARDEF=DF N MEAN STD MIN MAX MEDIAN;
		VAR Q16_HOURS;
		BY USvsForeignEd;
		FORMAT USvsForeignEd USvsForeignEd.;
		WEIGHT pct_wgtC;
RUN;

/* foreign-educated status, by number of positions respondents were currently employed as a nurse */
		
PROC SQL;
	CREATE VIEW WORK.SORT217 AS
		SELECT USvsForeignEd, Q15_NUM_POSITIONS, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Number of Positions Respondents were Currently Employed as a Nurse';
PROC FREQ DATA = WORK.SORT217
	ORDER=INTERNAL;
	TABLES Q15_NUM_POSITIONS * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q15_NUM_POSITIONS Q15_NUM_POSITIONS.;
RUN;

/* foreign-educated status, by primary employment setting */
	
PROC SQL;
	CREATE VIEW WORK.SORT218 AS
		SELECT USvsForeignEd, Q20_PRIMARY_SETTING, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Primary Employment Setting';
PROC FREQ DATA = WORK.SORT218
	ORDER=INTERNAL;
	TABLES Q20_PRIMARY_SETTING * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q20_PRIMARY_SETTING Q20_PRIMARY_SETTING.;
RUN;

/* foreign-educated status, by primary position title */
	
PROC SQL;
	CREATE VIEW WORK.SORT219 AS
		SELECT USvsForeignEd, Q21_PRIMARY_TITLE, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Primary Position Title';
PROC FREQ DATA = WORK.SORT219
	ORDER=INTERNAL;
	TABLES Q21_PRIMARY_TITLE * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q21_PRIMARY_TITLE Q21_PRIMARY_TITLE.;
RUN;

/* foreign-educated status, by primary employment specialty */
	
PROC SQL;
	CREATE VIEW WORK.SORT220 AS
		SELECT USvsForeignEd, Q22_PRIMARY_SPECIALTY, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Primary Employment Specialty';
PROC FREQ DATA = WORK.SORT220
	ORDER=INTERNAL;
	TABLES Q22_PRIMARY_SPECIALTY * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd. Q22_PRIMARY_SPECIALTY Q22_PRIMARY_SPECIALTY.;
RUN;

/* foreign-educated status, by specialty setting */
		
PROC SQL;
	CREATE VIEW WORK.SORT221 AS
		SELECT USvsForeignEd, Q17A_CAMP, Q17B_CORRECTIONAL, Q17C_DEV_DISABILITY, Q17D_FAITH, Q17E_FORENSIC, Q17F_HOLISTIC,
		Q17G_MILITARY, Q17H_TELEHEALTH, Q17I_TRAVEL, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Foreign-educated Status, by Specialty Setting';
PROC FREQ DATA = WORK.SORT221
	ORDER=INTERNAL;
	TABLES Q17A_CAMP * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17B_CORRECTIONAL * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17C_DEV_DISABILITY * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17D_FAITH * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17E_FORENSIC * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17F_HOLISTIC * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17G_MILITARY * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17H_TELEHEALTH * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	TABLES Q17I_TRAVEL * USvsForeignEd / NOROW NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT USvsForeignEd USvsForeignEd.;
RUN;

/* telehealth utilization */

PROC SQL;
	CREATE VIEW WORK.SORT222 AS
		SELECT Q28_TELEHEALTH, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Telehealth Utilization';
PROC FREQ DATA = WORK.SORT222
	ORDER=INTERNAL;
	TABLES Q28_TELEHEALTH / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q28_TELEHEALTH Q28_TELEHEALTH.;
RUN;

/* telehealth utilization across a state boarder */

PROC SQL;
	CREATE VIEW WORK.SORT223 AS
		SELECT Q29_TELEHEALTH_STATEBORDER, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Telehealth Utilization Across a State Boarder';
PROC FREQ DATA = WORK.SORT223
	ORDER=INTERNAL;
	TABLES Q29_TELEHEALTH_STATEBORDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q29_TELEHEALTH_STATEBORDER Q29_TELEHEALTH_STATEBORDER.;
RUN;

/* telehealth utilization across a national boarder */

PROC SQL;
	CREATE VIEW WORK.SORT224 AS
		SELECT Q30_TELEHEALTH_NATIONALBORDER, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Telehealth Utilization Across a State Boarder';
PROC FREQ DATA = WORK.SORT224
	ORDER=INTERNAL;
	TABLES Q30_TELEHEALTH_NATIONALBORDER / NOCOL NOCUM NOPERCENT SCORES=TABLE;
	WEIGHT pct_wgtC;
	FORMAT Q30_TELEHEALTH_NATIONALBORDER Q30_TELEHEALTH_NATIONALBORDER.;
RUN;

/* modes of commmunication used for telehealth */

PROC SQL;
	CREATE VIEW WORK.SORT225 AS
		SELECT Q31_NA, Q31_ELECTRONIC_MESSAGE, Q31_VOIP, Q31_VIRTUAL_ICU, Q31_TELEPHONE, Q31_EMAIL,
		Q31_VIDEOCALL, Q31_OTHER, Q31_SPECIFY, pct_wgtC
	FROM WORK.analyses;
QUIT;
		         
Title 'Modes of Communication used for Telehealth';
PROC FREQ DATA = WORK.SORT225
	ORDER=INTERNAL;
	TABLES Q31_NA / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_ELECTRONIC_MESSAGE / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_VOIP / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_VIRTUAL_ICU / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_TELEPHONE / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_EMAIL / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_VIDEOCALL / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_OTHER / NOCOL NOCUM SCORES=TABLE;
	TABLES Q31_SPECIFY / NOCOL NOCUM SCORES=TABLE;
	WEIGHT pct_wgtC;
RUN;

 

GOPTIONS NOACCESSIBLE;
%LET _CLIENTTASKLABEL=;
%LET _CLIENTPROJECTPATH=;
%LET _CLIENTPROJECTNAME=;
%LET _SASPROGRAMFILE=;

;*';*";*/;quit;run;
ODS _ALL_ CLOSE;
