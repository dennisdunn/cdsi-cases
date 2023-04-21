(in-package :cl-cdsi-case-library)

(defstruct catalog
  id
  name
  text)

(defstruct testcase
  id
  name
  text
  evaluation
  forecast
  patient
  doses)

(defstruct evaluation
  series-status
  evaluation-type)

(defstruct forecast
  number
  earliest
  recommended
  past-due
  vaccine-group
  forecast-type)

(defstruct patient
  dob
  gender
  assessment)

(defstruct dose
  number
  date-administered
  vaccine-name
  cvx
  mvx
  evaluation-status
  evaluation-reason)
