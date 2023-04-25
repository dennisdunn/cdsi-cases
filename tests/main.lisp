(in-package :cl-user)

(defpackage :cdsi-cases/tests
  (:use :cl
        :rove))

(in-package :cdsi-cases/tests)

(deftest test-the-case-library-catalog
         (testing "load the catalog of the case library"
                  (let ((ids (cdsi-cases:catalog)))
                    (ok (= (length ids) 823))))

         (testing "get a specific testcase from the case library"
                  (let ((tcase (cdsi-cases:get-case "2013-0001")))
                    (ok (string= (cdsi-cases::testcase-id tcase) "2013-0001")))))
