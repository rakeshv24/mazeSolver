; Auto-generated. Do not edit!


(cl:in-package maze-msg)


;//! \htmlinclude m_goal.msg.html

(cl:defclass <m_goal> (roslisp-msg-protocol:ros-message)
  ((res
    :reader res
    :initarg :res
    :type cl:integer
    :initform 0))
)

(cl:defclass m_goal (<m_goal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <m_goal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'm_goal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maze-msg:<m_goal> is deprecated: use maze-msg:m_goal instead.")))

(cl:ensure-generic-function 'res-val :lambda-list '(m))
(cl:defmethod res-val ((m <m_goal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-msg:res-val is deprecated.  Use maze-msg:res instead.")
  (res m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <m_goal>) ostream)
  "Serializes a message object of type '<m_goal>"
  (cl:let* ((signed (cl:slot-value msg 'res)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <m_goal>) istream)
  "Deserializes a message object of type '<m_goal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'res) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<m_goal>)))
  "Returns string type for a message object of type '<m_goal>"
  "maze/m_goal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'm_goal)))
  "Returns string type for a message object of type 'm_goal"
  "maze/m_goal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<m_goal>)))
  "Returns md5sum for a message object of type '<m_goal>"
  "ca16cfbd5443ad97f6cc7ffd6bb67292")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'm_goal)))
  "Returns md5sum for a message object of type 'm_goal"
  "ca16cfbd5443ad97f6cc7ffd6bb67292")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<m_goal>)))
  "Returns full string definition for message of type '<m_goal>"
  (cl:format cl:nil "int32 res~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'm_goal)))
  "Returns full string definition for message of type 'm_goal"
  (cl:format cl:nil "int32 res~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <m_goal>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <m_goal>))
  "Converts a ROS message object to a list"
  (cl:list 'm_goal
    (cl:cons ':res (res msg))
))
