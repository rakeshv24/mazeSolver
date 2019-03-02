;; Auto-generated. Do not edit!


(when (boundp 'maze::det_srv)
  (if (not (find-package "MAZE"))
    (make-package "MAZE"))
  (shadow 'det_srv (find-package "MAZE")))
(unless (find-package "MAZE::DET_SRV")
  (make-package "MAZE::DET_SRV"))
(unless (find-package "MAZE::DET_SRVREQUEST")
  (make-package "MAZE::DET_SRVREQUEST"))
(unless (find-package "MAZE::DET_SRVRESPONSE")
  (make-package "MAZE::DET_SRVRESPONSE"))

(in-package "ROS")





(defclass maze::det_srvRequest
  :super ros::object
  :slots (_detection_flag _actMinLaserValue _turnSpeed ))

(defmethod maze::det_srvRequest
  (:init
   (&key
    ((:detection_flag __detection_flag) nil)
    ((:actMinLaserValue __actMinLaserValue) 0.0)
    ((:turnSpeed __turnSpeed) 0.0)
    )
   (send-super :init)
   (setq _detection_flag __detection_flag)
   (setq _actMinLaserValue (float __actMinLaserValue))
   (setq _turnSpeed (float __turnSpeed))
   self)
  (:detection_flag
   (&optional __detection_flag)
   (if __detection_flag (setq _detection_flag __detection_flag)) _detection_flag)
  (:actMinLaserValue
   (&optional __actMinLaserValue)
   (if __actMinLaserValue (setq _actMinLaserValue __actMinLaserValue)) _actMinLaserValue)
  (:turnSpeed
   (&optional __turnSpeed)
   (if __turnSpeed (setq _turnSpeed __turnSpeed)) _turnSpeed)
  (:serialization-length
   ()
   (+
    ;; bool _detection_flag
    1
    ;; float32 _actMinLaserValue
    4
    ;; float32 _turnSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _detection_flag
       (if _detection_flag (write-byte -1 s) (write-byte 0 s))
     ;; float32 _actMinLaserValue
       (sys::poke _actMinLaserValue (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _turnSpeed
       (sys::poke _turnSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _detection_flag
     (setq _detection_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _actMinLaserValue
     (setq _actMinLaserValue (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _turnSpeed
     (setq _turnSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass maze::det_srvResponse
  :super ros::object
  :slots (_success _goal ))

(defmethod maze::det_srvResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _goal (round __goal))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; int32 _goal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; int32 _goal
       (write-long _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass maze::det_srv
  :super ros::object
  :slots ())

(setf (get maze::det_srv :md5sum-) "ee92c41b1aa6150e49f8725366020017")
(setf (get maze::det_srv :datatype-) "maze/det_srv")
(setf (get maze::det_srv :request) maze::det_srvRequest)
(setf (get maze::det_srv :response) maze::det_srvResponse)

(defmethod maze::det_srvRequest
  (:response () (instance maze::det_srvResponse :init)))

(setf (get maze::det_srvRequest :md5sum-) "ee92c41b1aa6150e49f8725366020017")
(setf (get maze::det_srvRequest :datatype-) "maze/det_srvRequest")
(setf (get maze::det_srvRequest :definition-)
      "bool detection_flag
float32 actMinLaserValue
float32 turnSpeed
---
bool success
int32 goal
")

(setf (get maze::det_srvResponse :md5sum-) "ee92c41b1aa6150e49f8725366020017")
(setf (get maze::det_srvResponse :datatype-) "maze/det_srvResponse")
(setf (get maze::det_srvResponse :definition-)
      "bool detection_flag
float32 actMinLaserValue
float32 turnSpeed
---
bool success
int32 goal
")



(provide :maze/det_srv "ee92c41b1aa6150e49f8725366020017")


