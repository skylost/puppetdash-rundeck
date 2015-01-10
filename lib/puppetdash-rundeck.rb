require 'sinatra/base'
require 'builder/xchar'
require 'open-uri'
require 'json'
require 'yaml'

class PuppetdashRundeck < Sinatra::Base

  config = YAML.load_file(settings.root + '/../config/puppetdash-rundeck.yml')
  @@puppetdashboard_url = config['puppetdashboard']['url']

  class << self
    def configure
    end
  end

  def xml_escape(input)
    # don't know if is string, so convert to string first, then to XML escaped text.
    return input.to_s.to_xs
  end

  def respond(db_type=nil)
    response['Content-Type'] = 'text/xml'
    response_xml = %Q(<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE project PUBLIC "-//DTO Labs Inc.//DTD Resources Document 1.0//EN" "project.dtd">\n<project>\n)
    
    # Get json 
    puppetdash_json = open("#{@@puppetdashboard_url}/#{db_type}.json").read
    puppetdashboard = JSON.parse(puppetdash_json)
    puppetdashboard.each do |hash|
      shortname = hash['name'].split(".")[0]
      response_xml << <<-EOH
<node name="#{shortname}"
     type="Node"
     description="node #{hash['name']}"
     osArch="Linux"
     osFamily="unix"
     osName="Debian"
     osVersion="7.4"
     tags="#{hash['status']}"
     username="rundeck"
     nodename="#{shortname}"
     hostname="#{hash['name']}"/>
     EOH
    end
    response_xml << "</project>"
    response_xml
  end

  get '/' do
    respond("nodes")
  end

  get '/type/:type' do
    puts "nodes/#{:type}"	  
    respond("nodes/#{:type}")
  end

end
