;;; open file and read
(let ((in (open "./readme.md" :if-does-not-exist nil)))
  (when in
    (format t "~a~%" (read-line in))
    (close in)))

;;; write to the file (append / overwrite / supersede)
(let ((out (open "./readme.md" :direction :output :if-exists :append)))
  (when out
   (write-line "test text" out))
   (close out))

;;; with-open-file can close the stream automatic
(with-open-file (stream "./readme.md")
  (format t "~a~%" (read-line stream)))

(with-open-file (stream "./test.txt" :direction :output)
  (format stream "test text."))

(make-pathname
 :directory '(:relative "test" "second")
 :name "baz"
 :type "txt")

(make-pathname :name "foo" :type "txt")

(merge-pathnames #p"foo/bar.html" #p"/www/html/")

(merge-pathnames #p"foo/bar.html" #p"html/")

(enough-namestring #p"/www/html/foo/bar.html" #p"/www/")

(merge-pathnames 
  (enough-namestring #p"/www/html/foo/bar/baz.html" #p"/www/")
  #p"/www-backups/")

