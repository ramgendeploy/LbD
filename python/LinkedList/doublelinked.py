from typing import List

class Node:
  def __init__(self, itemValue):
    self.value = itemValue
    self.__next = None
    self.__prev = None
  
  def __repr__(self) -> str:
    return f"{self.value}"

class LinkedList:
  def __init__(self, nodes:List = None):
    self.__head = None

    if nodes is not None:
      for elem in nodes:
        self.insert(elem)
  
  def first(self) -> Node:
    return self.__head
  
  def next(self, a:Node):
    return a.__next
    
  def pop(self) -> Node:
    toPop = self.__head
    self.__head = toPop.__next
    if self.__head:
      self.__head.prev = None
    return toPop

  def insert(self, value: int) -> Node:
    assert(type(value) == int)

    node = Node(value)
    if self.__head:
      self.__head.__prev = node
    node.__next = self.__head

    self.__head = node
    self.__head.__prev = None
    return self.__head
  
  

  def isEmpty(self) -> bool:
    return self.__head == None


  def __repr__(self) -> str:
    repr = "Null->"
    guide = self.__head
    while(guide):
      repr+=f"{guide.value}->"
      guide=guide.__next
    repr+="Null"
    return repr

