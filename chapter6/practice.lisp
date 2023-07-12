(defun chapter6-foo (x)
  (format t "Parameter is ~a~%" x)
  (let ((x 2))
    (format t "Outer let: ~a~%" x)
    (let ((x 3))
      (format t "Inner let:  ~a~%" x)
    )
    (format t "Outer let: ~a~%" x)
  )
  (format t "Parameter is ~a~%" x)
)

(dotimes (x 10) (format t "~d~%" x))