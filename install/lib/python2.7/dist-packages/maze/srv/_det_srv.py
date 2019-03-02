# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from maze/det_srvRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class det_srvRequest(genpy.Message):
  _md5sum = "93a9de35c20639956c3493dda3c97dd5"
  _type = "maze/det_srvRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """bool detection_flag
float32 actMinLaserValue
float32 turnSpeed
"""
  __slots__ = ['detection_flag','actMinLaserValue','turnSpeed']
  _slot_types = ['bool','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       detection_flag,actMinLaserValue,turnSpeed

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(det_srvRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.detection_flag is None:
        self.detection_flag = False
      if self.actMinLaserValue is None:
        self.actMinLaserValue = 0.
      if self.turnSpeed is None:
        self.turnSpeed = 0.
    else:
      self.detection_flag = False
      self.actMinLaserValue = 0.
      self.turnSpeed = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B2f().pack(_x.detection_flag, _x.actMinLaserValue, _x.turnSpeed))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.detection_flag, _x.actMinLaserValue, _x.turnSpeed,) = _get_struct_B2f().unpack(str[start:end])
      self.detection_flag = bool(self.detection_flag)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B2f().pack(_x.detection_flag, _x.actMinLaserValue, _x.turnSpeed))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.detection_flag, _x.actMinLaserValue, _x.turnSpeed,) = _get_struct_B2f().unpack(str[start:end])
      self.detection_flag = bool(self.detection_flag)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B2f = None
def _get_struct_B2f():
    global _struct_B2f
    if _struct_B2f is None:
        _struct_B2f = struct.Struct("<B2f")
    return _struct_B2f
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from maze/det_srvResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class det_srvResponse(genpy.Message):
  _md5sum = "ba4d98e39076ae8da08ac539ca4323ba"
  _type = "maze/det_srvResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """bool success
int32 goal
"""
  __slots__ = ['success','goal']
  _slot_types = ['bool','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       success,goal

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(det_srvResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.success is None:
        self.success = False
      if self.goal is None:
        self.goal = 0
    else:
      self.success = False
      self.goal = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_Bi().pack(_x.success, _x.goal))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.success, _x.goal,) = _get_struct_Bi().unpack(str[start:end])
      self.success = bool(self.success)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_Bi().pack(_x.success, _x.goal))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.success, _x.goal,) = _get_struct_Bi().unpack(str[start:end])
      self.success = bool(self.success)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_Bi = None
def _get_struct_Bi():
    global _struct_Bi
    if _struct_Bi is None:
        _struct_Bi = struct.Struct("<Bi")
    return _struct_Bi
class det_srv(object):
  _type          = 'maze/det_srv'
  _md5sum = 'ee92c41b1aa6150e49f8725366020017'
  _request_class  = det_srvRequest
  _response_class = det_srvResponse
