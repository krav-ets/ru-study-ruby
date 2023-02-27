module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        yield(first)
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |acc, item|
          acc << yield(item)
          acc
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, item|
          acc << item unless item.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        accum = acc.nil? ? self[0] : yield(acc, first)
        MyArray.new(self[1..]).my_reduce(accum, &block)
      end
    end
  end
end
