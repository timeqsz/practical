(defparameter *x* (make-array 5 :fill-pointer 0))
(defparameter *y* (vector 1 2 3))

(vector-push 'a *x* )
(vector-push 'b *x* )
(vector-push 'c *x* )

(vector-pop *x* )
(vector-pop *x* )
(vector-pop *x* )

(length *y* )
(elt *y* 0 )
(elt *y* 1 )
(elt *y* 2)
(elt *y* 3)
(setf (elt *y* 0) 10)

;; count          (count  1 #(1 2 1 2 3 1 2 3 4))        -> 3 
;; remove         (remove 1 #(1 2 1 2 3 1 2 3 4))        -> #(2 2 3 2 3 4)           ;;same type
;; remove         (remove 1 '(1 2 1 2 3 1 2 3 4))        -> (2 2 3 2 3 4)
;; remove         (remove #\a "foobarbaz")               -> "foobrbz"
;; substitute     (substitute 10 1 #(1 2 1 2 3 1 2 3 4)) -> #(10 2 10 2 3 10 2 3 4)  ;;same type
;; substitute     (substitute 10 1 '(1 2 1 2 3 1 2 3 4)) ->  (10 2 10 2 3 10 2 3 4)
;; substitute     (substitute #\x #\b "foobarbaz")       -> "fooxarxaz"
;; find           (find 1  #(1 2 1 2 3 1 2 3 4))         -> 1
;; find           (find 10 #(1 2 1 2 3 1 2 3 4))         -> Nil
;; position       (position 1 #(1 2 1 2 3 1 2 3 4))      -> 0



