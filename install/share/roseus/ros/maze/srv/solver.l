;; Auto-generated. Do not edit!


(when (boundp 'maze::solver)
  (if (not (find-package "MAZE"))
    (make-package "MAZE"))
  (shadow 'solver (find-package "MAZE")))
(unless (find-package "MAZE::SOLVER")
  (make-package "MAZE::SOLVER"))
(unless (find-package "MAZE::SOLVERREQUEST")
  (make-package "MAZE::SOLVERREQUEST"))
(unless (find-package "MAZE::SOLVERRESPONSE")
  (make-package "MAZE::SOLVERRESPONSE"))

(in-package "ROS")





(defclass maze::solverRequest
  :super ros::object
  :slots (_solver_flag ))

(defmethod maze::solverRequest
  (:init
   (&key
    ((:solver_flag __solver_flag) nil)
    )
   (send-super :init)
   (setq _solver_flag __solver_flag)
   self)
  (:solver_flag
   (&optional __solver_flag)
   (if __solver_flag (setq _solver_flag __solver_flag)) _solver_flag)
  (:serialization-length
   ()
   (+
    ;; bool _solver_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _solver_flag
       (if _solver_flag (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _solver_flag
     (setq _solver_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass maze::solverResponse
  :super ros::object
  :slots (_success ))

(defmethod maze::solverResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass maze::solver
  :super ros::object
  :slots ())

(setf (get maze::solver :md5sum-) "5d821c29b15d91578a95e40c5ed91b99")
(setf (get maze::solver :datatype-) "maze/solver")
(setf (get maze::solver :request) maze::solverRequest)
(setf (get maze::solver :response) maze::solverResponse)

(defmethod maze::solverRequest
  (:response () (instance maze::solverResponse :init)))

(setf (get maze::solverRequest :md5sum-) "5d821c29b15d91578a95e40c5ed91b99")
(setf (get maze::solverRequest :datatype-) "maze/solverRequest")
(setf (get maze::solverRequest :definition-)
      "bool solver_flag
---
bool success
")

(setf (get maze::solverResponse :md5sum-) "5d821c29b15d91578a95e40c5ed91b99")
(setf (get maze::solverResponse :datatype-) "maze/solverResponse")
(setf (get maze::solverResponse :definition-)
      "bool solver_flag
---
bool success
")



(provide :maze/solver "5d821c29b15d91578a95e40c5ed91b99")


