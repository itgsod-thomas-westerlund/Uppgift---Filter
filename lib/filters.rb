def filter(array: ,value:)
  r = []

  if array.any? { |w| value =~ /#{w}/ }
     l = array.length
    array.delete(value)
    l -= array.length
    while l > 0
    r<<value
    l -= 1
    end


  end
  return r


end


def unique(array:)
  r = []
  x = 0
  while x < array.length
    unless r.any? { |w| array[x] =~ /#{w}/ }
    r<<array[x]
  end
  x += 1
  end
  return r


end

def exclude(array: ,value:)
  r = []
  if array.any? { |w| value =~ /#{w}/ }
    array.delete(value)
    r = array
  end
  return r
end
