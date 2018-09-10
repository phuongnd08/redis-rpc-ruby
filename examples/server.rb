#!/usr/bin/env ruby

require 'redis'

require File.expand_path('../../lib/redis-rpc', __FILE__)
require File.expand_path('../calc', __FILE__)

redis_server = Redis.new
message_queue = 'calc'
local_object = Calculator.new
server = RedisRpc::Server.new redis_server, message_queue, local_object, verbose: true
server.run
