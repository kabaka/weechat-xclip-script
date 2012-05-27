# WeeChat xclip Script

Paste from the X clipboard.

*Requires xclip*

There is already
[a perfectly good xclip script](http://weechat.org/scripts/source/stable/xclip.pl.html/)
available in the WeeChat script repo. This one functions a bit differently,
though:

* Multi-line input is pasted in multiple lines. (This bypasses WeeChat's
built-in protection for large pastes!)
* Tabs are expanded to four spaces.

# Usage

Bind a key to `/xclip`. For example, for ctrl-v:

    /key bind ctrl-V /xclip

Or, if you'd like, just type `/xclip` when you want to paste.

# Known Problems

* It is possible to paste massive amounts of text if your clipboard has
unexpected contents.
