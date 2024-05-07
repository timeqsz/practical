(defvar *account-numbers* 0)

(defclass bank-account ()
  ((customer-name
     :initarg :customer-name)
   (balance
     :initarg :balance
     :initform 0)
   (account-number
     :initform (incf *account-numbers*))))

(defmethod initialize-instance :after ((account bank-account) &key)
  (let ((balance (slot-value account 'balance)))
    (setf (slot-value account 'account-type)
          (cond
            ((>= balance 100000) :gold)
            ((>= balance 50000)  :sliver)
            (t :bronze)))))

(defparameter *account*
  (make-instance 'bank-account :customer-name "John Doe" :balance 1000))

(print (slot-value *account* 'customer-name))
(print (slot-value *account* 'balance))
(print (slot-value *account* 'account-number))