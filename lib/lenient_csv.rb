require "strscan"

require "lenient_csv/version"

class LenientCSV
  include Enumerable

  def initialize(source)
    @scanner = StringScanner.new(source)
  end

  def each
    until @scanner.eos?
      yield scan_row
    end
  end

  private

  def scan_row
    row = []
    loop do
      if value = scan_field
        row << value
      end

      if @scanner.scan /,/
        next
      elsif @scanner.scan /\r?\n/ or @scanner.eos?
        return row
      else
        raise "Malformed row at #{@scanner.inspect}"
      end
    end
  end

  def scan_field
    scan_quoted_field or
      scan_unquoted_field
  end

  def scan_quoted_field
    if @scanner.scan /"/
      value = ""
      loop do
        if @scanner.scan /[^\\"]+/
          value << @scanner.matched
        # Unix-style quoting
        # (Don't care about "\t" => <tab>)
        elsif @scanner.scan /\\/
          value << @scanner.getch
        # CSV RFC 4180-style quoting
        elsif @scanner.scan /""/
          value << '"'
        elsif @scanner.scan /"/
          return value
        else
          raise "unexpected EOF inside quoted value #{@scanner.inspect}"
        end
      end
    end
  end

  def scan_unquoted_field
    @scanner.scan /[^,\r\n]*/
  end
end
