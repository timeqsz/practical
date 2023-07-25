; (defun test-+()
;     (and
;         (= (+ 1 2) 3)
;         (= (+ 1 2 3) 6)
;         (= (+ -1 -3) -4)
;     )
; )

; (defun test-+()
;     (format t "~:[Fail~;Pass~] ... ~a~%" (= (+ 1 2) 3) '(= (+ 1 2) 3))
;     (format t "~:[Fail~;Pass~] ... ~a~%" (= (+ 1 2 3) 6) '(= (+ 1 2 3) 6))
;     (format t "~:[Fail~;Pass~] ... ~a~%" (= (+ -1 -3) -4) '(= (+ -1 -3) -4))
; )

(defvar *test-name* nil)

(defun report-result (result form)
    (format t "~:[Fail~;Pass~] ... ~a: ~a~%" result *test-name* form))

; (defun test-+()
;     (report-result (= (+ 1 2) 3) '(= (+ 1 2) 3))
;     (report-result (= (+ 1 2 3) 6) '(= (+ 1 2 3) 6))
;     (report-result (= (+ -1 -3) -4) '(= (+ -1 -3) -4)))

(defmacro check()
    `(report-result ,form ',form))
    
(defmacro check (&body forms)
    `(progn
        ,@(loop for f in forms collect `(report-result ,f ',f))))

; (defun test-+ ()
;     (let ((*test-name* 'test-+))
;       (check
;         (= (+ 1 2) 3)
;         (= (+ 1 2 3) 6)
;         (= (+ -1 -3) -4))))

(defun test-* ()
    (let ((*test-name* 'test-*))
      (check
        (= (* 2 2) 4)
        (= (* 3 5) 15)
        (= (* -1 -3) 3))))

(defun test-arithmetic ()
    (test-+)
    (test-*))

(defmacro deftest (name parameters &body body)
    `(defun ,name ,parameters
        (let ((*test-name* ',name))
            ,@body)))

(deftest test-+ ()
    (check
      (= (+ 1 2) 3)
      (= (+ 1 2 3) 6)
      (= (+ -1 -3) -4)))

