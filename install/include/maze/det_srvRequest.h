// Generated by gencpp from file maze/det_srvRequest.msg
// DO NOT EDIT!


#ifndef MAZE_MESSAGE_DET_SRVREQUEST_H
#define MAZE_MESSAGE_DET_SRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace maze
{
template <class ContainerAllocator>
struct det_srvRequest_
{
  typedef det_srvRequest_<ContainerAllocator> Type;

  det_srvRequest_()
    : detection_flag(false)
    , actMinLaserValue(0.0)
    , turnSpeed(0.0)  {
    }
  det_srvRequest_(const ContainerAllocator& _alloc)
    : detection_flag(false)
    , actMinLaserValue(0.0)
    , turnSpeed(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _detection_flag_type;
  _detection_flag_type detection_flag;

   typedef float _actMinLaserValue_type;
  _actMinLaserValue_type actMinLaserValue;

   typedef float _turnSpeed_type;
  _turnSpeed_type turnSpeed;





  typedef boost::shared_ptr< ::maze::det_srvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::maze::det_srvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct det_srvRequest_

typedef ::maze::det_srvRequest_<std::allocator<void> > det_srvRequest;

typedef boost::shared_ptr< ::maze::det_srvRequest > det_srvRequestPtr;
typedef boost::shared_ptr< ::maze::det_srvRequest const> det_srvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::maze::det_srvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::maze::det_srvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace maze

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'maze': ['/home/rakesh/flytbase/mazesolver/src/maze/msg', '/home/rakesh/flytbase/mazesolver/devel/.private/maze/share/maze/msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::maze::det_srvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::maze::det_srvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::maze::det_srvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::maze::det_srvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::maze::det_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::maze::det_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::maze::det_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "93a9de35c20639956c3493dda3c97dd5";
  }

  static const char* value(const ::maze::det_srvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x93a9de35c2063995ULL;
  static const uint64_t static_value2 = 0x6c3493dda3c97dd5ULL;
};

template<class ContainerAllocator>
struct DataType< ::maze::det_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "maze/det_srvRequest";
  }

  static const char* value(const ::maze::det_srvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::maze::det_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool detection_flag\n\
float32 actMinLaserValue\n\
float32 turnSpeed\n\
";
  }

  static const char* value(const ::maze::det_srvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::maze::det_srvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.detection_flag);
      stream.next(m.actMinLaserValue);
      stream.next(m.turnSpeed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct det_srvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::maze::det_srvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::maze::det_srvRequest_<ContainerAllocator>& v)
  {
    s << indent << "detection_flag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.detection_flag);
    s << indent << "actMinLaserValue: ";
    Printer<float>::stream(s, indent + "  ", v.actMinLaserValue);
    s << indent << "turnSpeed: ";
    Printer<float>::stream(s, indent + "  ", v.turnSpeed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAZE_MESSAGE_DET_SRVREQUEST_H