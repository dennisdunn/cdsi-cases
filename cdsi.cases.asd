(defsystem "cdsi.cases"
           :description "CDSi Testcase Library"
           :author "Dennis Dunn <ansofive@gmail.com>"
           :license "MIT"
           :version "0.1.0"
           :serial t
           :depends-on ("cl-csv")
           :components ((:module "src"
                                 :components ((:file "config")
                                              (:file "csv")
                                              (:file "main"))))
           :in-order-to ((test-op (test-op "cdsi.cases/tests"))))

(defsystem "cdsi.cases/tests"
           :author "Dennis Dunn <ansofive@gmail.com>"
           :license "MIT"
           :version "0.1.0"
           :depends-on ("cdsi.cases"
                        "rove")
           :components ((:module "tests"
                                 :components ((:file "main"))))
           :perform (test-op (op c) (symbol-call :rove :run c)))
