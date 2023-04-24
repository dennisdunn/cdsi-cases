(in-package :cl-user)

(defpackage :cdsi-cases/config
  (:use :cl)
  (:export :*data-file*))

(in-package :cdsi-cases/config)

(defparameter *data-file* (asdf:system-relative-pathname
                            "cdsi-cases"
                            "data/cdsi-healthy-childhood-and-adult-test-cases-v4.8.csv"))
