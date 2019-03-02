// Auto-generated. Do not edit!

// (in-package maze.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class det_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detection_flag = null;
      this.actMinLaserValue = null;
      this.turnSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('detection_flag')) {
        this.detection_flag = initObj.detection_flag
      }
      else {
        this.detection_flag = false;
      }
      if (initObj.hasOwnProperty('actMinLaserValue')) {
        this.actMinLaserValue = initObj.actMinLaserValue
      }
      else {
        this.actMinLaserValue = 0.0;
      }
      if (initObj.hasOwnProperty('turnSpeed')) {
        this.turnSpeed = initObj.turnSpeed
      }
      else {
        this.turnSpeed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type det_srvRequest
    // Serialize message field [detection_flag]
    bufferOffset = _serializer.bool(obj.detection_flag, buffer, bufferOffset);
    // Serialize message field [actMinLaserValue]
    bufferOffset = _serializer.float32(obj.actMinLaserValue, buffer, bufferOffset);
    // Serialize message field [turnSpeed]
    bufferOffset = _serializer.float32(obj.turnSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type det_srvRequest
    let len;
    let data = new det_srvRequest(null);
    // Deserialize message field [detection_flag]
    data.detection_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [actMinLaserValue]
    data.actMinLaserValue = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [turnSpeed]
    data.turnSpeed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'maze/det_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93a9de35c20639956c3493dda3c97dd5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool detection_flag
    float32 actMinLaserValue
    float32 turnSpeed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new det_srvRequest(null);
    if (msg.detection_flag !== undefined) {
      resolved.detection_flag = msg.detection_flag;
    }
    else {
      resolved.detection_flag = false
    }

    if (msg.actMinLaserValue !== undefined) {
      resolved.actMinLaserValue = msg.actMinLaserValue;
    }
    else {
      resolved.actMinLaserValue = 0.0
    }

    if (msg.turnSpeed !== undefined) {
      resolved.turnSpeed = msg.turnSpeed;
    }
    else {
      resolved.turnSpeed = 0.0
    }

    return resolved;
    }
};

class det_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type det_srvResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = _serializer.int32(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type det_srvResponse
    let len;
    let data = new det_srvResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'maze/det_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba4d98e39076ae8da08ac539ca4323ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    int32 goal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new det_srvResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: det_srvRequest,
  Response: det_srvResponse,
  md5sum() { return 'ee92c41b1aa6150e49f8725366020017'; },
  datatype() { return 'maze/det_srv'; }
};
