(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped)
)

;;(make-cd "Rose" "Kathy Mattea" 7 t)

(defvar *db* nil)

(defun add-record (cd) (push cd *db*))

(defun dump-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)
  )
)

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io* )
  (read-line *query-io* )
)

(defun prompt-for-cd ()
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p (prompt-read "Ripped [y/n]"))
  )
)

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
    (if (not (y-or-n-p "Another? [y/n]")) (return))
  )
)

(defun save-db (filename)
  (with-open-file (out filename 
                   :direction :output 
                   :if-exists :supersede)
    (with-standard-io-syntax (print *db* out) )
  )
)

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax (setf *db* (read in)) )
  )
)

(defun select-by-artist (artist)
  (remove-if-not
    #'(lambda (cd) (equal (getf cd :artist) artist))
    *db*
  )
)

;; abstract select by
(defun select (selector-fn)
  (remove-if-not selector-fn *db*)
)

(defun artist-selector (artist)
  #'(lambda (cd) (equal (getf cd :artist) artist))
)

(defun delete-rows (selector-fn)
  (setf *db* (remove-if selector-fn *db*))
)

;; `(1 2 (+ 1 2))
;; `(1 2 ,(+ 1 2))

(defun make-comparison-expr (field value)
  `(equal (getf cd ,filed) ,value)
)

(defun make-comparison-list (field)
  (loop while fields
    collecting (make-comparison-expr (pop fields) (pop values))
  )
)

(defmacro where (&rest clauses)
  `(lambda (cd) (and ,@(make-comparison-list clauses)))
)

