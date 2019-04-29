# Installation Manual
1. Download SQLClient from https://github.com/martinrybak/SQLClient
2. Drag and drop the contents of the SQLClient/SQLClient/SQLClient folder into your Xcode project
3. Select Destination - Copy items if needed 
4. Choose Added folders - Create groups
5. Go to Project -> Build Phases -> Link Binary With Libraries then click +(plus) and add libiconv.dylib/ libiconv.tbd
6. Create header file as Bridge to import 'SQLClient'
7. Go to Build Settings -> Swift Compiler - General, then add header file name at 'Objective-C Bridging Header' section

# Follow - https://github.com/martinrybak/SQLClient
