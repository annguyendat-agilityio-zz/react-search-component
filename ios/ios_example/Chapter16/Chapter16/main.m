//
//  main.m
//  Chapter16
//
//  Created by Hau Nguyen on 8/29/14.
//  Copyright (c) 2014 ___ANHHAU___. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *fName = @"testFile", *path;
    NSFileManager *fm;
    NSDictionary *attr;
    NSDirectoryEnumerator *dirEnum;
    NSData *data = [@"dataTest" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSFileHandle *inFile, *outFile;
    NSData *buffer;
    
    inFile = [NSFileHandle fileHandleForReadingAtPath: @"testfile"];
    [[NSFileManager defaultManager] createFileAtPath: @"testout" contents: nil attributes: nil];
    outFile = [NSFileHandle fileHandleForWritingAtPath: @"testout"];
    
    [outFile truncateFileAtOffset: 0];
    
    buffer = [inFile readDataToEndOfFile];
    [outFile writeData: buffer];
    // Close the two files
    [inFile closeFile]; [outFile closeFile];
    
    if (inFile == nil) {
      NSLog (@"Open of testfile for reading failed");
    }
    
    fm = [NSFileManager defaultManager];
    
    path = [fm currentDirectoryPath];
    dirEnum = [fm enumeratorAtPath: path];
    
    while ((path = [dirEnum nextObject]) != nil) NSLog (@"%@", path);
    
    // Need to create an instance of the file manager fm = [NSFileManager defaultManager];
    // Let's make sure our test file exists first
    [fm createFileAtPath: fName contents: data attributes: nil];
    
    if ([fm fileExistsAtPath: fName] == NO) {
      NSLog(@"File doesn't exist!");
      return 1;
    }
    //now lets make a copy
    if ([fm copyItemAtPath: fName toPath: @"newfile" error: NULL] == NO) {
      NSLog(@"File Copy failed!");
      return 2;
    }
    // Now let's test to see if the two files are equal
    if ([fm contentsEqualAtPath: fName andPath: @"newfile"] == NO) {
      NSLog(@"Files are Not Equal!");
      return 3;
    }
    // Now lets rename the copy
    if ([fm moveItemAtPath: @"newfile" toPath: @"newfile2" error: NULL] == NO){
      NSLog(@"File rename Failed");
      return 4;
    }
    // get the size of the newfile2
    if ((attr = [fm attributesOfItemAtPath: @"newfile2" error: NULL]) == nil) {
      NSLog(@"Couldn't get file attributes!");
      return 5;
    }
    
    NSLog(@"File size is %llu bytes",[[attr objectForKey: NSFileSize] unsignedLongLongValue]);
    
    // And finally, let's delete the original file
    if ([fm removeItemAtPath: fName error: NULL] == NO) { NSLog(@"file removal failed");
      return 6;
    }
    NSLog(@"All operations were successful");
    
    // Display the contents of the newly-created file
    NSLog(@"%@", [NSString stringWithContentsOfFile: @"newfile2" encoding:NSUTF8StringEncoding error:NULL]);
    
    
    
  }
  return 0;
}

