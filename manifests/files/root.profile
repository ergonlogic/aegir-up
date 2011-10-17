# ~/.profile: executed by Bourne-compatible login shells.

# fix for 'stdin is not a tty' warning
if [ $(expr index "$-" i) -eq 0 ]; then
  return
fi

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
