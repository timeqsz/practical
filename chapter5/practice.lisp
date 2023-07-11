(defun verbose-sum (x y)
  "Sum any two numbers after printing a message."
  (format t "Summing ~d and ~d.~%" x y)
  (+ x y)
)

(defun optional-functions (a b &optional c d) 
  (list a b c d)
)


(defun optional-default-functions (a &optional (b 10)) 
  (list a b)
)

(defun make-rectangle (width height)
  (list width height (* width height))
)

(defun foo (a b &optional (c 3 c-supplied-p))
  (list a b c c-supplied-p)
)