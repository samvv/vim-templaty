Templaty Plugin for Vim/Neovim
==============================

This a very simple plugin that adds syntax highlighting to [Templaty][1] files.
The plugin will attempt to detect when another programming language is being
used and automatically apply the correct highlighter to the file.

## Installation

We recommend the lightweight [vim-plug][2] if you have no plugin manager yet.
Simply add the following to your `.vimrc` or `init.vim`:

```vim
" add this between the plug#begin and plug#end calls
Plug 'samvv/vim-templaty'
```

After issuing `PlugInstall` and restarting Vim, the plugin should automatically
work.

## FAQ

### My programming language is not detected. How can fix this?

Currently, this plugin uses a very simple algorithm for detecting the
underlying file type of the template. Chances are that the algorithm does not
work for your use-case, so your best bet is to [open an issue][3] so I can take
a look at the problem.

## License

This plugin is licensed under the relatively permissive Apache license, which should 
let you do almost anything with it except for claiming that it is yours.

[1]: https://github.com/samvv/Templaty
[2]: https://github.com/junegunn/vim-plug
[3]: https://github.com/samvv/vim-templaty/issues
