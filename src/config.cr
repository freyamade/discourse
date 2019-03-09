require "colorize"

module Crcophony
  # Environment variable config loader class
  class Config
    # Env key names
    @@CHANNEL_ID_KEY = "CRCOPHONY_CHANNEL_ID"
    @@TOKEN_KEY = "CRCOPHONY_TOKEN"
    @@USER_ID_KEY = "CRCOPHONY_USER_ID"

    # Config variables
    @channel_id : UInt64
    @token : String
    @user_id : UInt64

    # The ID of the channel to connect to (will be removed as soon as channel switching is implemented)
    getter channel_id
    # The user token used to log in
    getter token
    # The user id (isn't necessary to specify initially so I might get rid of this requirement)
    getter user_id

    # Attempt to load configuration from the environment
    def initialize
      # Channel ID
      if ENV[@@CHANNEL_ID_KEY]?
        channel_id = ENV[@@CHANNEL_ID_KEY]
        if channel_id.to_u64?
          @channel_id = channel_id.to_u64
        else
          puts "Crcophony Config Error: Could not load `#{@@CHANNEL_ID_KEY}` as it is not a valid 64 bit unsigned integer.".colorize :red
          Process.exit 1
        end
      else
        puts "Crcophony Config Error: Could not load `#{@@CHANNEL_ID_KEY}`. Have you set the environment variable?".colorize :red
        Process.exit 1
      end

      # User token
      if ENV[@@TOKEN_KEY]?
        @token = ENV[@@TOKEN_KEY]
      else
        puts "Crcophony Config Error: Could not load `#{@@TOKEN_KEY}`. Have you set the environment variable?".colorize :red
        Process.exit 1
      end

      # User ID
      if ENV[@@USER_ID_KEY]?
        user_id = ENV[@@USER_ID_KEY]
        if user_id.to_u64?
          @user_id = user_id.to_u64
        else
          puts "Crcophony Config Error: Could not load `#{@@USER_ID_KEY}` as it is not a valid 64 bit unsigned integer.".colorize :red
          Process.exit 1
        end
      else
        puts "Crcophony Config Error: Could not load `#{@@USER_ID_KEY}`. Have you set the environment variable?".colorize :red
        Process.exit 1
      end
    end
  end
end
