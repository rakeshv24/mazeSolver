; Auto-generated. Do not edit!


(cl:in-package maze-srv)


;//! \htmlinclude solver-request.msg.html

(cl:defclass <solver-request> (roslisp-msg-protocol:ros-message)
  ((solver_flag
    :reader solver_flag
    :initarg :solver_flag
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass solver-request (<solver-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <solver-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'solver-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maze-srv:<solver-request> is deprecated: use maze-srv:solver-request instead.")))

(cl:ensure-generic-function 'solver_flag-val :lambda-list '(m))
(cl:defmethod solver_flag-val ((m <solver-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:solver_flag-val is deprecated.  Use maze-srv:solver_flag instead.")
  (solver_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <solver-request>) ostream)
  "Serializes a message object of type '<solver-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'solver_flag) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <solver-request>) istream)
  "Deserializes a message object of type '<solver-request>"
    (cl:setf (cl:slot-value msg 'solver_flag) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<solver-request>)))
  "Returns string type for a service object of type '<solver-request>"
  "maze/solverRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'solver-request)))
  "Returns string type for a service object of type 'solver-request"
  "maze/solverRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<solver-request>)))
  "Returns md5sum for a message object of type '<solver-request>"
  "5d821c29b15d91578a95e40c5ed91b99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'solver-request)))
  "Returns md5sum for a message object of type 'solver-request"
  "5d821c29b15d91578a95e40c5ed91b99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<solver-request>)))
  "Returns full string definition for message of type '<solver-request>"
  (cl:format cl:nil "bool solver_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'solver-request)))
  "Returns full string definition for message of type 'solver-request"
  (cl:format cl:nil "bool solver_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <solver-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <solver-request>))
  "Converts a ROS message object to a list"
  (cl:list 'solver-request
    (cl:cons ':solver_flag (solver_flag msg))
))
;//! \htmlinclude solver-response.msg.html

(cl:defclass <solver-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass solver-response (<solver-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <solver-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'solver-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maze-srv:<solver-response> is deprecated: use maze-srv:solver-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <solver-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maze-srv:success-val is deprecated.  Use maze-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <solver-response>) ostream)
  "Serializes a message object of type '<solver-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <solver-response>) istream)
  "Deserializes a message object of type '<solver-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<solver-response>)))
  "Returns string type for a service object of type '<solver-response>"
  "maze/solverResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'solver-response)))
  "Returns string type for a service object of type 'solver-response"
  "maze/solverResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<solver-response>)))
  "Returns md5sum for a message object of type '<solver-response>"
  "5d821c29b15d91578a95e40c5ed91b99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'solver-response)))
  "Returns md5sum for a message object of type 'solver-response"
  "5d821c29b15d91578a95e40c5ed91b99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<solver-response>)))
  "Returns full string definition for message of type '<solver-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'solver-response)))
  "Returns full string definition for message of type 'solver-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <solver-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <solver-response>))
  "Converts a ROS message object to a list"
  (cl:list 'solver-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'solver)))
  'solver-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'solver)))
  'solver-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'solver)))
  "Returns string type for a service object of type '<solver>"
  "maze/solver")