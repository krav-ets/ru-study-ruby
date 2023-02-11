module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self do
          yield(item)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = []
        my_each do |item|
          result << yield(item)
        end
        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, item|
          acc << item unless item.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        array = MyArray.new(self)
        acc, *rest = args.empty? ? array : array.unshift(args.first)
        MyArray.new(rest).my_each do |item|
          acc = yield(acc, item)
        end
        acc
      end
    end
  end
end
