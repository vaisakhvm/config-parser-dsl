require 'yaml'

class ConfigParser
  def initialize(file)
    @file = file
    @config = {}
  end

  def parse
    instance_eval(File.read(@file))
  end

  def server(name, &block)
    @config[:server] = { name: name }
    instance_eval(&block)
  end

  def port(number)
    @config[:server][:port] = number
  end

  def enable_ssl(value)
    @config[:server][:enable_ssl] = value
  end

  def database(name, &block)
    @config[:database] = { name: name }
    instance_eval(&block)
  end

  def username(name)
    @config[:database][:username] = name
  end

  def password(pass)
    @config[:database][:password] = pass
  end

  def to_h
    @config
  end
end

parser = ConfigParser.new('config.dsl')
parser.parse
puts parser.to_h.to_yaml
