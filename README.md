A Vim plugin for executing operations on the files in the quickfix list.

If the current window has a local quickfix list (a location list), then
it's used instead of the global quickfix list, otherwise the global
quickfix list is used.

## Qdo command

The plugin adds a `:Qdo` command, which executes a command once for each file in the quickfix list.

Usage example:

    :GitGrep foo.*bar
    :Qdo %s/foo.*bar/baz/g | update

This will replace text and save the buffers for each file found by GitGrep in the previous search.

## Qargs command

The plugin also adds a `:Qargs` command, which populates the argument list from the files in the quickfix list. Each file is only added once, even if there are multiple lines for the same file in the quickfix list.

Usage example:

    :args *.txt
    :vimgrep /foo/g ##
    :Qargs
    :argdo %s/foo/bar/ge
    :argdo update

## References

For an step-by-step guide and explanation, refer to the article [Project Wide Search And Replace In Vim With Qdo](http://thepugautomatic.com/2012/07/project-wide-search-and-replace-in-vim-with-qdo/).

For a video tutorial of search and replace strategies, and the original code which this plugin is based on, refer to [
Project-wide find and replace](http://vimcasts.org/episodes/project-wide-find-and-replace/).

For a description of the need and the approach used by this solution, refer to the question [Search & replace using quickfix list in Vim](http://stackoverflow.com/a/5686810/128850).
