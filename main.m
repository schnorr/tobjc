/*
    This file is part of tobjc

    tobjc is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    tobjc is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with tobjc.  If not, see <http://www.gnu.org/licenses/>.
*/
#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>
#include "tobjc.h"

int main (int argc, const char **argv)
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSApplication *app = [NSApplication sharedApplication];
  Tobjc *delegate = [Tobjc new];
  [app setDelegate: delegate];

  int ret = NSApplicationMain (argc, argv);
  NSLog (@"main function terminating");
  [pool release];
  return ret;
}

