// Generated by gencpp from file maze/solverRequest.msg
// DO NOT EDIT!


#ifndef MAZE_MESSAGE_SOLVERREQUEST_H
#define MAZE_MESSAGE_SOLVERREQUEST_H


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
struct solverRequest_
{
  typedef solverRequest_<ContainerAllocator> Type;

  solverRequest_()
    : solver_flag(false)  {
    }
  solverRequest_(const ContainerAllocator& _alloc)
    : solver_flag(false)  {
  (void)_alloc;
    }



   typedef uint8_t _solver_flag_type;
  _solver_flag_type solver_flag;





  typedef boost::shared_ptr< ::maze::solverRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::maze::solverRequest_<ContainerAllocator> const> ConstPtr;

}; // struct solverRequest_

typedef ::maze::solverRequest_<std::allocator<void> > solverRequest;

typedef boost::shared_ptr< ::maze::solverRequest > solverRequestPtr;
typedef boost::shared_ptr< ::maze::solverRequest const> solverRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::maze::solverRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::maze::solverRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::maze::solverRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::maze::solverRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::maze::solverRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::maze::solverRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::maze::solverRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::maze::solverRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::maze::solverRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b167fc1b376acb8f1142c4f903e3237b";
  }

  static const char* value(const ::maze::solverRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb167fc1b376acb8fULL;
  static const uint64_t static_value2 = 0x1142c4f903e3237bULL;
};

template<class ContainerAllocator>
struct DataType< ::maze::solverRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "maze/solverRequest";
  }

  static const char* value(const ::maze::solverRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::maze::solverRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool solver_flag\n\
";
  }

  static const char* value(const ::maze::solverRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::maze::solverRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.solver_flag);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct solverRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::maze::solverRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::maze::solverRequest_<ContainerAllocator>& v)
  {
    s << indent << "solver_flag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.solver_flag);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAZE_MESSAGE_SOLVERREQUEST_H