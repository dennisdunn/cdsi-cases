(defsystem :cl-cdsi-case-library
           :description "CDSi Testcase Library"
           :author "Dennis Dunn <ansofive@gmail.com>"
           :license "MIT"
           :version "0.1.0"
           :serial t
           :depends-on ("cl-csv")
           :components ((:module "src"
                                 :serial t
                                 :components ((:file "packages")
                                              (:file "config")
                                              (:file "structs")
                                              (:file "csv")
                                              (:file "caselib"))))
           :in-order-to ((test-op (test-op :cl-cdsi-case-library/tests))))

(defsystem :cl-cdsi-case-library/tests
           :author "Dennis Dunn <ansofive@gmail.com>"
           :license "MIT"
           :version "0.1.0"
           :depends-on (:cl-cdsi-case-library
                        :rove)
           :components ((:module "tests"
                                 :serial t
                                 :components ((:file "packages")
                                              (:file "caselib"))))
           :perform (test-op (op c) (symbol-call :rove :run c)))
