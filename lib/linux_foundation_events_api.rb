# frozen_string_literal: true

require_relative 'linux_foundation_events_api/version'
require 'jbuilder'
require 'nokogiri'
require 'open-uri'

module LinuxFoundationEventsApi
  class Error < StandardError; end

  # Events class
  class Events
    def initialize; end

    def calendar
      # Use the events calendar for now.
      @calendar ||= Nokogiri::HTML(URI.open('https://events.linuxfoundation.org/about/calendar/'))
    end

    def events
      @events ||= calendar.css('.grid-x > article').map { |event| Event.new(event) }
    end

    def to_builder
      Jbuilder.new do |json|
        json.array!(events.collect { |event| event.to_builder.attributes! })
      end
    end
  end

  # Event class
  class Event
    def initialize(noko_event)
      @raw_event = noko_event
    end

    def title
      @raw_event.at_css('h5 > strong > a').text.strip
    end

    def url
      @raw_event.at_css('h5 > strong > a')['href'].strip
    end

    def date
      date = @raw_event.at_css('p > .date').text.strip

      begin
        Date.parse(date)
      rescue Date::Error
        date
      end
    end

    def location
      @raw_event.at_css('p > .country').text.strip
    end

    def cfp
      @raw_event.at_css('p > .cfp > span').text.strip
    end

    def to_builder
      Jbuilder.new do |event|
        event.call(self, :title, :url, :date, :location, :cfp)
      end
    end
  end
end
