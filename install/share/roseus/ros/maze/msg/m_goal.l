;; Auto-generated. Do not edit!


(when (boundp 'maze::m_goal)
  (if (not (find-package "MAZE"))
    (make-package "MAZE"))
  (shadow 'm_goal (find-package "MAZE")))
(unless (find-package "MAZE::M_GOAL")
  (make-package "MAZE::M_GOAL"))

(in-package "ROS")
;;//! \htmlinclude m_goal.msg.html


(defclass maze::m_goal
  :super ros::object
  :slots (_res ))

(defmethod maze::m_goal
  (:init
   (&key
    ((:res __res) 0)
    )
   (send-super :init)
   (setq _res (round __res))
   self)
  (:res
   (&optional __res)
   (if __res (setq _res __res)) _res)
  (:serialization-length
   ()
   (+
    ;; int32 _res
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _res
       (write-long _res s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _res
     (setq _res (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get maze::m_goal :md5sum-) "ca16cfbd5443ad97f6cc7ffd6bb67292")
(setf (get maze::m_goal :datatype-) "maze/m_goal")
(setf (get maze::m_goal :definition-)
      "int32 res
")



(provide :maze/m_goal "ca16cfbd5443ad97f6cc7ffd6bb67292")


