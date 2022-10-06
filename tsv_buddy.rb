# frozen_string_literal: true

TAB = "\t"
NEW_LINE = "\n"

# This is module TsvBuddy!
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    contents = tsv.split("\n").map { |line| line.chomp.split("\t") }
    title = contents.first # pop datas first row as title
    @data = contents[1..].map do |content|
      title.zip(content).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv_str = ''
    title = @data[0].keys
    keys = title.reduce { |sum, num| "#{sum}#{TAB}#{num}" }
    tsv_str = "#{tsv_str}#{keys}#{NEW_LINE}"

    @data.map do |row_data|
      tmp = row_data.values.reduce { |sum, num| "#{sum}#{TAB}#{num}" }
      tsv_str = "#{tsv_str}#{tmp}#{NEW_LINE}"
    end

    @data = tsv_str
  end
end
