# Redirect Notes

## Directing Outputs to File
Table derived from [this StackOverFlow post](https://askubuntu.com/a/731237), focussing on directing StdOut, StdErr and both streams to file:


|     Syntax      | StdOut (Term) | StdErr (Term) | StdOut (File) | StdErr (File) | Existing file |
| :-------------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
|       `>`       |      no       |      yes      |      yes      |      no       |   overwrite   |
|      `>>`       |      no       |      yes      |      yes      |      no       |    append     |
|                 |               |               |               |               |       -       |
|      `2>`       |      yes      |      no       |      no       |      yes      |   overwrite   |
|      `2>>`      |      yes      |      no       |      no       |      yes      |    append     |
|                 |               |               |               |               |       -       |
|      `&>`       |      no       |      no       |      yes      |      yes      |   overwrite   |
|      `&>>`      |      no       |      no       |      yes      |      yes      |    append     |

But what if we want to copy rather than redirect a stream?

## T Junctions
Now let's look at making a copy while redirecting (again from [the same post]((https://askubuntu.com/a/731237))):
|     Syntax      | StdOut (Term) | StdErr (Term) | StdOut (File) | StdErr (File) | Existing file |
| :-------------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
|     `| tee`     |      yes      |      yes      |      yes      |      no       |   overwrite   |
|   `| tee -a`    |      yes      |      yes      |      yes      |      no       |    append     |
|                 |               |               |               |               |       -       |
|    `|& tee`     |      yes      |      yes      |      yes      |      yes      |   overwrite   |
|   `|& tee -a`   |      yes      |      yes      |      yes      |      yes      |    append     |

Note that the `|&` notation may not work on some older versions of bash.

## Redirecting Between Streams
It is also possible to redirect between streams within terminal as [described here](https://stackoverflow.com/a/818284):
|     Syntax      | StdOut (Term) | StdErr (Term) |
| :-------------: | :-----------: | :-----------: |
|     `1>&2`      |      no       | yes + StdOut  |
|     `2>&1`      | yes + StdErr  |      no       |


## Combining Redirections 
So an alternative way to monitor a running script while also writing to file should be this:

|     Syntax      | StdOut (Term) | StdErr (Term) | StdOut (File) | StdErr (File) | Existing file |
| :-------------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
|  `2>&1 | tee`   | yes + StdErr  |      no       |      yes      |      yes      |   overwrite   |
| `2>&1 | tee -a` | yes + StdErr  |      no       |      yes      |      yes      |    append     |
