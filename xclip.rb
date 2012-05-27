# Copyright (C) 2010-2012 Kyle Johnson <kyle@vacantminded.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#
# Paste multi-line data from the X clipboard using xclip -o. Tries to handle
# tabs sanely so that logs and other formatted data can be pasted.
#
# History:
#
#   2012-05-27:
#   version 0.2
#    * MIT license.
#    * Just use backticks rather than hook_process.
#    * Code style changes.
#
#   2011-11-01:
#   version 0.1
#     * First version.


def weechat_init
  Weechat.register "xclip", "Kabaka", "0.2", "MIT",
    "Multi-line X Clipboard Paster", "", ""

  Weechat.hook_command "xclip", "Paste from the X clipboard.", "", "",
    "Should probably be bound to key (/key bind ctrl-V /xclip)",
    "xclip_cb", ""
end

def xclip_cb data, buffer, args
  `xclip -o`.each_line do |line|
    Weechat.command buffer, line.gsub("\t", '    ')
  end

  Weechat::WEECHAT_RC_OK
end
