require 'curb'
require 'nokogiri'

module LaundryView
  class Sync 
    include Enumerable

    WINDSOR=185842
    def initialize room
      @room = room
      @agent = Curl::Easy.new "http://laundryview.com/laundry_room.php?lr=#{@room}"
      @agent.follow_location = true
      @agent.enable_cookies = true
      @agent.perform
      self.update
      nil
    end

    def update
      @agent.url = "http://laundryview.com/classic_laundry_room_ajax.php?lr=#{@room}"
      @agent.perform
      @machines = parse_body @agent.body_str
    end

    def count
      @machines.count
    end

    def each &block
      @machines.each &block
    end

    private
    def parse_body body
      doc = Nokogiri::HTML body
      stats = doc.css('span.stat')
      machines = stats.map {|s| LaundryView::Machine.new(s.text.strip)}
    end
  end

  class Machine
    def initialize status
      @status = status
    end

    def status
      @status
    end

    def remaining
      return 0 if @status == "cycle has ended - door still closed"
      return -1 if @status == "available"
      if @status =~ /est. time remaining [0-9]+ min/ or @status =~ /running for [0-9]+ mins/
        return @status.match(/[0-9]+/)[0].to_i
      end
      9999
    end
  end
end
