(in-package :cl-user)

(defpackage :cdsi.cases
  (:use :cl
        :cdsi.cases.config
        :cdsi.cases.csv)
  (:export ::list-cases
           :get-case))

(in-package :cdsi.cases)

(defun mk-catalog (header row)
  (list :id (csv-value header row "CDC_Test_ID")
                :name (csv-value header row "TestCase_Name")
                :text (csv-value header row "General_Description")))

(defun mk-testcase (header row)
  (list :id (csv-value header row "CDC_Test_ID")
                 :name (csv-value header row "TestCase_Name")
                 :text (csv-value header row "General_Description")
                 :patient (mk-patient header row)
                 :evaluation (mk-evaluation header row)
                 :forecast (mk-forecast header row)
                 :doses (mk-doses header row)))

(defun mk-patient (header row)
  (list :id (csv-value header row "CDC_Test_ID")
                :dob (csv-value header row "DOB")
                :gender (csv-value header row "gender")
                :assessment (csv-value header row "Assessment_Date")))

(defun mk-forecast (header row)
  (list :number (csv-value header row "Forecast_#")
                 :earliest (csv-value header row "Earliest_Date")
                 :recommended (csv-value header row "Recommended_Date")
                 :past-due (csv-value header row "Past_Due_Date")
                 :vaccine-group (csv-value header row "Vaccine_Group")
                 :forecast-type (csv-value header row "Forecast_Test_Type")))

(defun mk-evaluation (header row)
  (list :series-status (csv-value header row "Series_Status")
                   :evaluation-type (csv-value header row "Evaluation_Test_Type")))

(defun mk-doses (header row)
  (loop for n from 1 to 7
          when (csv-value header row (format nil "Date_Administered_~a" n))
        collect (list :number (format nil "~a" n)
                           :date-administered (csv-value header row (format nil "Date_Administered_~a" n))
                           :vaccine-name (csv-value header row (format nil "Vaccine_Name_~a" n))
                           :cvx (csv-value header row (format nil "CVX_~a" n))
                           :mvx (csv-value header row (format nil "MVX_~a" n))
                           :evaluation-status (csv-value header row (format nil "Evaluation_Status_~a" n))
                           :evaluation-reason (csv-value header row (format nil "Evaluation_Reason_~a" n)))))

(defun list-cases ()
  "Get a catalog of all testcases."
  (multiple-value-bind (header rows) (csv-read *data-file*)
    (mapcar (lambda (row) (mk-catalog header row)) rows)))

(defun get-case (id)
  "Load the testcase identified by the argument."
  (multiple-value-bind (header rows) (csv-read *data-file*)
    (mk-testcase header (find-if (lambda (x) (string= id (csv-value header x "CDC_Test_ID"))) rows))))
