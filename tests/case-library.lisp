(in-package :cl-cdsi-cases/tests)

(deftest test-the-case-library-catalog
  (testing "load the catalog"
    (let ((ids (get-catalog)))
      (ok (= (length ids) 823))))

  (testing "get a specific testcase from the catalog"
    (let ((tcase (get-case "2013-0001")))
      (ok (string= (cl-cdsi-cases::testcase-id tcase) "2013-0001")))))
