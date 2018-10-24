

array = [1, 2, 3, 4, 5, 6, 7]


def bin_search(arr, x)

  low = 0
  high = arr.length - 1

  while(low <= high)
    puts "Looking in #{arr[low..high]} for #{x}"
    mid = low + (high - low)/2
    puts "mid: #{mid}"
    return mid if x == arr[mid]
    if arr[mid] > x
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return nil
end



arr = [1, 2, 3, 4, 5, 6, 7, 8, 8, 8]


def min_search(arr)

  low = 0
  high = arr.length - 1

  while(low <= high)
    puts "searching #{arr[low..high]}"
    return low if arr[low] <= arr[high]
    mid = low + (high - low)/2
    return mid if arr[(mid - 1) % arr.length] > arr[mid]
    if arr[low] > arr[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
  return 'something went wrong'
end

puts min_search(arr)