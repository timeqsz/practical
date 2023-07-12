(defun practice-do
  (do ((n 0 (1+ n))
       (cur 0 next)
       (next 1 (+ cur next)))
      ((= 10 n) cur)
  )
)