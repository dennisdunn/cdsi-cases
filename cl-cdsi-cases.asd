(defsystem :cl-cdsi-cases
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
                                              (:file "case-library"))))
           :in-order-to ((test-op (test-op :cl-cdsi-cases/tests))))

(defsystem :cl-cdsi-cases/tests
           :author "Dennis Dunn <ansofive@gmail.com>"
           :license "MIT"
           :version "0.1.0"
           :depends-on (:cl-cdsi-cases
                        :rove)
           :components ((:module "tests"
                                 :serial t
                                 :components ((:file "packages")
                                              (:file "case-library"))))
           :perform (test-op (op c) (symbol-call :rove :run c)))
