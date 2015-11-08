IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 100

begin
  require 'pp'
  require 'ori'
  require 'bond'
  require 'looksee'
  require 'awesome_print'

  Bond.start
rescue
end
