#! /usr/bin/env python3
import signal
import gi
gi.require_version('Gtk', '3.0')
gi.require_version('Gdk', '3.0')
from gi.repository import Gtk
from gi.repository import Gdk
from gi.repository import GLib


if __name__ == '__main__':
    # terminate app when Ctrl-C is pressed
    GLib.unix_signal_add(GLib.PRIORITY_DEFAULT, signal.SIGINT, Gtk.main_quit)
    win = Gtk.Window()
    win.connect('destroy', Gtk.main_quit)
    win.show_all()
    Gtk.main()
