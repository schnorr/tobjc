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
#include "tobjc.h"

@implementation Tobjc
- (void) applicationWillFinishLaunching: (NSNotification *)not
{
  thread = nil;
}

- (void) applicationDidFinishLaunching: (NSNotification *)not
{
  if (![NSBundle loadGSMarkupNamed: @"tobjc"  owner: self]){
    [[NSApplication sharedApplication] terminate:self];
  }
}

- (BOOL) windowShouldClose: (id) sender
{
  [[NSApplication sharedApplication] terminate:self];
  return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
  NSLog (@"Program termination");
  if ([thread isExecuting]){
    NSLog (@"finish the thread");
    [thread cancel];
    [thread release];
    thread = nil;
  }
}

- (void) thread: (id) sender
{
  NSLog (@"%s", __FUNCTION__);
  if (thread == nil){
    NSLog (@"%s the thread doesn't exist, create and start it", __FUNCTION__);
    thread = [[NSThread alloc] initWithTarget: self
                                     selector: @selector(run:)
                                       object: self];
    [thread start];
  }else{
    NSLog (@"%s the thread exist", __FUNCTION__);
    if ([thread isExecuting]){
      NSLog (@"%s the thread is executing, cancel it", __FUNCTION__);
      [thread cancel];
      [thread release];
      thread = nil;
    }
  }
}

- (void) run: (id) sender
{
  NSLog (@"%s start", __FUNCTION__);
  while (![[NSThread currentThread] isCancelled]){
    //do something
  }
  NSLog (@"%s end", __FUNCTION__);
}
@end
