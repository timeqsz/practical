(defclass base-class () 
  ((base-field :accessor base-field :initarg :base-field)))

(defclass derived-class (base-class) 
  ((derived-field :accessor derived-field :initarg :derived-field)))

(defgeneric do-something (obj)
  (:documentation "Perform an operation on an object."))

(defmethod do-something ((obj base-class))
  (format t "Base class method. Field: ~A~%" (base-field obj)))

(defmethod do-something ((obj derived-class))
  (call-next-method)
  (format t "Derived class method. Field: ~A~%" (derived-field obj)))

