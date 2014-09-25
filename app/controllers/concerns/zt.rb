################################################################################
#   zt.rb
#     Contains methods for debug output
#
#   13.09.2014   ZT
################################################################################
module Zt
  extend ActiveSupport::Concerns

  ##############################################################################
  #  Writes data to Log-file, defined in zt_settings.rb
  #  Writing to console and development.log tested as well
  #
  #  2014-04-24 Update
  #  2014-04-29 Last update
  ##############################################################################
  def zt_log *args
    if args.length == 0
      File.open(ZT_LOG_FILE, 'a') { |file_log| file_log.puts "#{zt_timestamp} #{params[:controller]}##{params[:action]} - no arguments"}
    else
      file_log = File.open(ZT_LOG_FILE, 'a')           # Opens file
      file_log.puts "#{zt_timestamp} #{params[:controller]}##{params[:action]}:"    # Writes controller#action

      # Writes all arguments to ...
      args.each_with_index do |arg, index|
        file_log.puts "arg[#{index}]: #{arg.inspect}"  # ... zt.log
        puts "arg[#{index}]: #{arg.inspect}"           # ... console
#       logger.debug "arg[#{index}]: #{arg.inspect}"   # ... console & development.log
      end
      file_log.close                                   #Closes file
    end
  end

  # Timestamp
  def zt_timestamp
    "\n#{Time.now.strftime('[%Y-%m-%d %H:%M:%S]')}"
  end
end
