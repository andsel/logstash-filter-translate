# encoding: utf-8
require "csv"

module LogStash module Filters module Dictionary
  class CsvFile < File

    protected

    def read_dictionary
      return enum_for(:read_dictionary) unless block_given?

      ::CSV.open(@dictionary_path, 'r:bom|utf-8') do |csv|
        csv.each { |k,v| yield(k,v) }
      end
    end
  end
end end end
