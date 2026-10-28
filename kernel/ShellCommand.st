Object subclass: ShellCommand [
    <category: 'Shell-Utilities'>
    | command arguments |
    ShellCommand class >> new [
        ^ self basicNew initialize
    ]
    initialize [
        command := ''.
        arguments := OrderedCollection new.
    ]
    command: aString [
        command := aString.
    ]
    addArgument: anObject [
        arguments add: anObject asString.
    ]
    asString [
        | str |
        str := command.
        arguments do: [:arg | str := str , ' ' , arg].
        ^ str
    ]
    run [
        ^ ShellUtility run: self asString
    ]
]
