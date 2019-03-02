; Auto-generated. Do not edit!


(cl:in-package maze-srv)


;//! \htmlinclude det_srv-request.msg.html

(cl:defclass <det_srv-request> (roslisp-msg-protocol:ros-message)
  ((detection_flag
    :reader detection_flag
    :initarg :detection_flag
    :type cl:boolean
    :initform cl:nil)
   (actMinLaserValue
    :reader actMinLaserValue
    :initarg :actMinLaserValue
    :type cl:float
    :initform 0.0)
   (turnSpeed
    :reader turnSpeed
    :initarg :turnSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass det_srv-request (<det_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <det_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'det_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maze-srv:<det_srv-request> is deprecated: use maze-srv:det_srv-request instead.")))

(cl:ensure-generic-function 'detection_flag-val :lambda-list '(m))
(cl:defmethod detection_flag-val ((m <det_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:detection_flag-val is deprecated.  Use maze-srv:detection_flag instead.")
  (detection_flag m))

(cl:ensure-generic-function 'actMinLaserValue-val :lambda-list '(m))
(cl:defmethod actMinLaserValue-val ((m <det_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:actMinLaserValue-val is deprecated.  Use maze-srv:actMinLaserValue instead.")
  (actMinLaserValue m))

(cl:ensure-generic-function 'turnSpeed-val :lambda-list '(m))
(cl:defmethod turnSpeed-val ((m <det_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:turnSpeed-val is deprecated.  Use maze-srv:turnSpeed instead.")
  (turnSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <det_srv-request>) ostream)
  "Serializes a message object of type '<det_srv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detection_flag) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'actMinLaserValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'turnSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <det_srv-request>) istream)
  "Deserializes a message object of type '<det_srv-request>"
    (cl:setf (cl:slot-value msg 'detection_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'actMinLaserValue) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turnSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<det_srv-request>)))
  "Returns string type for a service object of type '<det_srv-request>"
  "maze/det_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'det_srv-request)))
  "Returns string type for a service object of type 'det_srv-request"
  "maze/det_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<det_srv-request>)))
  "Returns md5sum for a message object of type '<det_srv-request>"
  "ee92c41b1aa6150e49f8725366020017")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'det_srv-request)))
  "Returns md5sum for a message object of type 'det_srv-request"
  "ee92c41b1aa6150e49f8725366020017")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<det_srv-request>)))
  "Returns full string definition for message of type '<det_srv-request>"
  (cl:format cl:nil "bool detection_flag~%float32 actMinLaserValue~%float32 turnSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'det_srv-request)))
  "Returns full string definition for message of type 'det_srv-request"
  (cl:format cl:nil "bool detection_flag~%float32 actMinLaserValue~%float32 turnSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <det_srv-request>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <det_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'det_srv-request
    (cl:cons ':detection_flag (detection_flag msg))
    (cl:cons ':actMinLaserValue (actMinLaserValue msg))
    (cl:cons ':turnSpeed (turnSpeed msg))
))
;//! \htmlinclude det_srv-response.msg.html

(cl:defclass <det_srv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass det_srv-response (<det_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <det_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'det_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maze-srv:<det_srv-response> is deprecated: use maze-srv:det_srv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <det_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:success-val is deprecated.  Use maze-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <det_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:goal-val is deprecated.  Use maze-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <det_srv-response>) ostream)
  "Serializes a message object of type '<det_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <det_srv-response>) istream)
  "Deserializes a message object of type '<det_srv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<det_srv-response>)))
  "Returns string type for a service object of type '<det_srv-response>"
  "maze/det_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'det_srv-response)))
  "Returns string type for a service object of type 'det_srv-response"
  "maze/det_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<det_srv-response>)))
  "Returns md5sum for a message object of type '<det_srv-response>"
  "ee92c41b1aa6150e49f8725366020017")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'det_srv-response)))
  "Returns md5sum for a message object of type 'det_srv-response"
  "ee92c41b1aa6150e49f8725366020017")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<det_srv-response>)))
  "Returns full string definition for message of type '<det_srv-response>"
  (cl:format cl:nil "bool success~%int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'det_srv-response)))
  "Returns full string definition for message of type 'det_srv-response"
  (cl:format cl:nil "bool success~%int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <det_srv-response>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <det_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'det_srv-response
    (cl:cons ':success (success msg))
    (cl:cons ':goal (goal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'det_srv)))
  'det_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'det_srv)))
  'det_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'det_srv)))
  "Returns string type for a service object of type '<det_srv>"
  "maze/det_srv")