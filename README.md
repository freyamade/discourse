# crcophony */kəˈkɒf(ə)ni/*
*read: cacophony*

A simple Discord terminal ui written in Crystal.

## Initial Design
![initial design](https://raw.githubusercontent.com/freyamade/crcophony/master/demo.png)

## Keybinds
### Normal
- <kbd>Ctrl</kbd>+<kbd>C</kbd>: Quit Application
- <kbd>Enter</kbd>: Send Message
- <kbd>Ctrl</kbd>+<kbd>W</kbd>: Scroll Up
- <kbd>Ctrl</kbd>+<kbd>S</kbd>: Scroll Down

### Channel Switching
- <kbd>Ctrl</kbd>+<kbd>K</kbd>: Open / Close Channel Selection Menu
- <kbd>Enter</kbd>: Select Channel
- <kbd>Ctrl</kbd>+<kbd>W</kbd>: Scroll Selection Up
- <kbd>Ctrl</kbd>+<kbd>S</kbd>: Scroll Selection Down
- <kbd>ESC</kbd>: Alternative Close Button

## Implemented Features
- Mentions are parsed back into usernames
- When you are mentioned it is written in your terminal's yellow colour.
- When you connect to a channel, the client will load the last 50 messages automatically
- The message container can now be scrolled using <kbd>Ctrl</kbd>+<kbd>W</kbd> and <kbd>Ctrl</kbd>+<kbd>S</kbd> for up and down respectively.
- Channel switcher available by pressing <kbd>Ctrl</kbd>+<kbd>K</kbd>
- Word wrapping so that you can actually read long messages

## Roadmap
- Search through channels using fuzzy searching (see below)
- Notifications
    - OS Notifications
    - Displaying the number of unread messages at the top of the screen at all times
    - Maybe move channels with unread messages to the top of the switcher?
- DMs and Group Chats
- Handle embeds and attachments
- Username colours (can't figure out best way to do these yet)

If you can think of stuff I am missing, open an issue c:

### Channel Switching Thoughts
It seems that when you initially login Discord sends a message containing all the servers and channels that the user is connected to. We could use fuzzy string matching on these to populate a list box that only appears when whatever hotkey is input. Fuzzy search through the list and press Enter to switch to the chosen channel, or Esc to go back to the current channel

## Setup
This project is in ***very*** early alpha. That said, you can currently use it a little bit if you want!
1. Install [Crystal](https://crystal-lang.org/reference/installation/)
2. Also you'll need [termbox](https://github.com/nsf/termbox) installed
3. Clone this repo
4. Run `shards install` to install requirements
5. Follow the steps in the [Gathering Data](#gathering-data) section to gather necessary information
6. Run `crystal run src/crcophony.cr` and after a couple of seconds it should pop up
7. Type and hit enter and messages should send :D

## Issues
If you run into any issues, check the `.log` files that have been created. If anything looks wrong, include the output in an issue ^^

## Gathering Data
To use the system, you must gather the following information and export the data as environment variables.
These variables are as follows;

- `CRCOPHONY_CHANNEL_ID`: The ID of the channel you wish to connect to (temporary, will be removed once I have sorted out the channel switching functionality)
- `CRCOPHONY_TOKEN`: Your user token used to authenticate yourself with the client
- `CRCOPHONY_USER_ID`: Your user id (might not be necessary, requires investigation and could be removed at a later point)

Here are the instructions for you to get these bits of data;
1. Turn on [Developer Mode](https://discordia.me/developer-mode)
2. To get the `channel_id`, right click on the channel you want to join and click "Copy ID". This is the value you should put in as the `channel_id`
3. To get the `user_id`, right click on your own name in the Users sidebar of any channel and click "Copy ID". This is the value you should put in as the `user_id`
4. Follow [this guide](https://discordhelp.net/discord-token) to get your token.

If you use the `fish` or `bash` shells, a sample `.env` file has been included in this project (`.env.sample.fish` and `env.sample.bash` respectively). Simply rename the appropriate file to `.env`, populate the strings inside with your gathered data and run `source .env` in the directory to get the correct environment variables created.
