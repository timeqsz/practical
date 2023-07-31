(defparameter *set* ())
(adjoin 1 *set*)
*set*
(setf *set* (adjoin 1 *set*))
(pushnew 2 *set*)
*set*
(pushnew 2 *set*)

(subst 10 1 '(1 2 (3 2 1) ((1 1) (2 2))))

; alist and plist 不可用于大型表
(assoc 'a '((a 1) (b 2) (c 3)))
(assoc "a" '(("a" 1) ("b" 2) ("c" 3)) :test #'string=)

(defun process-properties (plist keys)
    (loop while plist do
        (multiple-value-bind (key value tail) (get-properties plist keys)
            (when key (process-properties key value))
            (setf plist (cddr tail)))))

(destructuring-bind (x y z) (list  1 2 3) (list :x x :y y :z z))
