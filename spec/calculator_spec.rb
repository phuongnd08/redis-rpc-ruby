require File.expand_path( '../spec_helper.rb', __FILE__ )
require File.expand_path( '../../examples/calc.rb', __FILE__ )

describe Calculator do
  context "locally" do
    let(:calculator){ Calculator.new }

    it 'should calculate' do
      calculator.val.should == 0.0
      calculator.add(3).should == 3.0
      calculator.sub(2).should == 1.0
      calculator.mul(14).should == 14.0
      calculator.div(7).should == 2.0
      calculator.val.should == 2.0
      calculator.clr.should == 0.0
      calculator.val.should == 0.0
    end

    it 'should raise when missing method is called' do
      expect{ calculator.a_missing_method }.to raise_error(NoMethodError)
    end
  end

  context "over rpc" do
    let(:rpc_server_builder){ lambda{ RedisRpc::Server.new( Redis.new($REDIS_CONFIG), 'calc', Calculator.new ) } }
    before(:each) do
      @server_pid = fork{ rpc_server_builder.call.run }
    end
    after(:each){ Process.kill(9, @server_pid); rpc_server_builder.call.flush_queue! }
    let(:calculator){ RedisRpc::Client.new( $REDIS,'calc', 1) }

    it 'should calculate' do
      calculator.val.should == 0.0
      calculator.add(3).should == 3.0
      calculator.sub(2).should == 1.0
      calculator.mul(14).should == 14.0
      calculator.div(7).should == 2.0
      calculator.val.should == 2.0
      calculator.clr.should == 0.0
      calculator.val.should == 0.0
    end

    it 'should raise when missing method is called' do
      expect{ calculator.a_missing_method }.to raise_error(RedisRpc::RemoteException)
    end

    it 'should raise timeout when execution expires' do
      expect{ calculator.send(:sleep,2) }.to raise_error RedisRpc::TimeoutException
    end

    context "the request is executed late" do
      it "won't be executed" do
        allow(calculator).to receive(:get_timeout_at).and_return(Time.now.to_i - 1)
        expect { calculator.val }.to raise_error(RedisRpc::RemoteException, /Expired RPC call/)
      end
    end
  end
end
