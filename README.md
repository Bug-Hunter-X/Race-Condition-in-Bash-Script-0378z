# Race Condition Bug in Bash Script

This repository demonstrates a race condition bug in a bash script.  The script attempts to manage two concurrently running processes writing to different files. However, due to a flaw in its process management (incorrect process ID handling), the script does not reliably control the processes and may produce unexpected file contents or fail to terminate correctly.

The `bug.sh` file contains the buggy script, while `bugSolution.sh` provides a corrected version that avoids the race condition.

## How to reproduce
1. Clone the repository.
2. Run `bash bug.sh`
3. Observe the unpredictable output in file1.txt and file2.txt.
4. Run `bash bugSolution.sh` and compare the results.

## Bug Description
The core problem lies in how the script obtains and uses process IDs.  The `$$` variable only provides the current shell's PID, not the PID of the background processes created using the `&`. Therefore, `kill` commands are ineffective and the processes remain running indefinitely.