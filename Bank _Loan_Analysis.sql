Bank Loan Data – SQL Exploratory Analysis


SELECT * FROM Bank_Loan_Data

Q1-- Total Loan Applications 

SELECT COUNT(id) AS Total_Applications FROM Bank_Loan_Data;

Q2--MTD Loan Applications 

SELECT COUNT(id) AS MTD_Total_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q3--PMTD Loan Applications

SELECT COUNT(id) AS PMTD_Total_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

Q4--MTD Loan Funded Amount

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Loan_Data 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q5--PMTD Loan Funded Amount

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

Q6--Total Amount Received

SELECT SUM(total_payment) AS Total_Amount_received FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q7--MTD Total Amount Received

SELECT SUM(total_payment) AS MTD_Total_Amount_received FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q8--PMTD Total Amount Received

SELECT SUM(total_payment) AS PMTD_Total_Amount_received FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q9--MTD AVG interest Rate

SELECT ROUND(AVG(int_rate),4) * 100 AS MTD_Avg_interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q10--PMTD AVG interest Rate

SELECT  ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

Q11--Avg DTI

SELECT ROUND(AVG(dti),2) * 100 AS avg_DIT FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q12--MTD Avg DTI

SELECT ROUND(AVG(dti),4) * 100 AS MTD_avg_DIT FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

Q13--PMTD AVG DTI

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_avg_DIT FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

Q14--Good Loan Percentage 

 SELECT * FROM  Bank_loan_Data

 SELECT loan_status FROM Bank_Loan_Data

 SELECT   
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_loan_percentage
	FROM Bank_Loan_Data


	Q15--Good Loan Applications

	SELECT COUNT(id)AS Good_Loan_Applications FROM Bank_loan_Data
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
	 
	 Q16--Good Loan Funded Amount

	SELECT SUM(loan_amount) AS Good_loan_Funded_Amount FROM Bank_Loan_Data
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

	Q17--Good Loan Received Amount

	SELECT SUM(total_payment) AS Good_loan_Recieved_Amount FROM Bank_Loan_Data
	WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

	Q18--Bad Loan percentage

 SELECT   
    (COUNT(CASE WHEN loan_status = 'Charged off'  THEN id END) * 100.0)
	/
	COUNT(id) AS Bad_loan_percentage
	FROM Bank_Loan_Data

	Q19--Bad Loan Applications

	SELECT COUNT(id) AS Bad_loan_applications FROM  Bank_Loan_Data
	WHERE loan_status = 'charged off'

	Q20--Bad Loan Funded Amount

	SELECT SUM(loan_amount)  AS Bad_loan_Funded_amount FROM  Bank_Loan_Data
	WHERE loan_status = 'charged off'

	Q21--Bad Loan Amount Received

	SELECT SUM (total_payment) AS Bad_loan_Amount_received FROM  Bank_Loan_Data
	WHERE loan_status = 'charged off'

	Q22--Loan Status

	SELECT 
	       loan_status,
		   COUNT(id) AS LoanCount,
		   SUM(total_payment) AS Total_amount_received,
		   SUM(loan_amount) AS Total_Funded_Amount,
		   AVG(int_rate * 100) AS Interest_Rate,
		   AVG(dti * 100) AS DTI
   FROM
    Bank_Loan_Data
	GROUP BY
	loan_status

	SELECT 
	       loan_status,
		   SUM(total_payment) AS MTD_Total_amount_received,
		   SUM(loan_amount) AS MTD_Total_Funded_Amount
   FROM
    Bank_Loan_Data
	WHERE MONTH(issue_date) = 12
	GROUP BY
	loan_status


Q23--Monthly Trend Analysis

	SELECT 
	MONTH(issue_date)  AS month_Number,
	DATENAME(MONTH, issue_date) AS month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
	ORDER BY MONTH(issue_date)


Q24--State-Wise Loan Analysis

	
	SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY address_state
	ORDER BY COUNT(id) DESC



Q25--Loan Term Analysis
	
	SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY term
	ORDER BY term
	 
Q26--Employee Length Analysis
	 
	SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY emp_length
	ORDER BY emp_length


Q27--Loan Purpose Analysis

	
	SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY purpose
	ORDER BY COUNT(id) DESC

Q28--Home Ownership Analysis
	
	SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	GROUP BY home_ownership
	ORDER BY COUNT(id) DESC 


Q29--State-wise Analysis
	
	SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount, 
	SUM(total_payment) AS Total_Received_Amount
	FROM Bank_Loan_Data
	WHERE grade = 'A' AND address_state = 'CA'
	GROUP BY home_ownership
	ORDER BY COUNT(id) DESC


