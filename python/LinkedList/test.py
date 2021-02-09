from doublelinked import *


def max(linkedList, start):
  max = start
  guide = start
  while(linkedList.next(guide)):
    if(max.value< linkedList.next(guide).value):
      max = linkedList.next(guide)
    
    guide = linkedList.next(guide)
  
  return max

if __name__ == "__main__":
  orders = LinkedList([444,3,4,5,6,34,5,2,33,5,6,7,9,8,64,333])
  first = orders.first()
  second = orders.next(first)

  
  print(orders)

  print(max(orders, first).value)