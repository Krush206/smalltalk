Object subclass: ShellUtility [
    <category: 'Shell-Utilities'>
    <comment: 'ShellUtility provides convenience methods for executing external shell commands via FileDescriptor popen:'>
    ShellUtility class >> run: aCommand [
        ^ (FileDescriptor popen: aCommand dir: 'r') contents
    ]
    ShellUtility class >> runLines: aCommand [
        ^ (self run: aCommand) lines
    ]
    ShellUtility class >> runStatus: aCommand [
        | fd |
        fd := FileDescriptor popen: aCommand dir: 'r'.
        fd close.
        ^ fd status = 0
    ]
]
