#!/bin/bash
rm *.gem; gem build redis-rpc.gemspec; gem push *.gem
