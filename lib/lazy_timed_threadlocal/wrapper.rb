module LazyTimedThreadlocal
  class Wrapper
    def initialize(key:, init_callback:, timeout_callback:, timeout:)
      @key = key
      @init_callback = init_callback
      @timeout_callback = timeout_callback
      @timeout = timeout
    end


    def execute(update_time_used:true, &block)
      tl = thread_local
      sb = tl[:subject]
      last_used = tl[:last_used]
      @timeout_callback.call(sb, last_used) if (Time.now - last_used) > @timeout
      result = yield sb
      tl[:last_used] = Time.now if update_time_used
      result
    end

    protected

      def thread_local
        Thread.current[@key] ||= { subject: @init_callback.call, last_used: Time.now }
      end

      def subject
        sub = thread_local[:subject]
      end
  end
end