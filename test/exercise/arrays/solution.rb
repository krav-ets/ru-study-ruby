module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.reduce(array[0]) do |acc, num|
          acc = num if num > acc
          acc
        end
        array.map do |num|
          num >= 0 ? max_num : num
        end
      end

      def search(arr, target, left = 0, right = arr.length - 1)
        mid = (left + right) / 2
        return mid if arr[mid] == target
        return -1 if left >= right

        arr[mid] < target ? search(arr, target, mid + 1, right) : search(arr, target, left, mid)
      end
    end
  end
end
