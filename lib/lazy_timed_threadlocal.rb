require "lazy_timed_threadlocal/version"

class LazyTimedThreadlocal
  

  def initialize(key, init_callback, timeout_callback, timeout)
    @key = key
    @init_callback = init_callback
    @timeout_callback = timeout_callback
    @timeout = timeout
  end

  def execute(update_time_used:true, &block)
    tl = subject
    @timeout_callback.call(tl) if (Time.now.utc - tl[:last_used]) > @timeout
    yield tl
    tl[:last_used] = Time.utc.now if update_time_used
  end


  protected

    def thread_local
      Thread.current[@key] ||= { subject: @init_callback.call, last_used: Time.now.getutc }
    end

    def subject
      thread_local[:subject]
    end

end
