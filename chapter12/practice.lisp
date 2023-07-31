(defun upto (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (nreverse result)
  )
)

(defparameter *list* (list 4 3 2 1))
(sort *list* #'<)
*list*