     _   __ _         __ __ _       __        __              __   ___
    | | / /(_)__ _   / //_/(_)____ / /__ ___ / /_ ___ _ ____ / /_ / _ \
    | |/ // //  ' \ / ,<  / // __//  '_/(_-</ __// _ `// __// __// , _/
    |___//_//_/_/_//_/|_|/_/ \__//_/\_\/___/\__/ \_,_//_/   \__//_/|_|

Usage
-----

* Use this [vimrc](https://github.com/vivien/vimkickstartr/blob/master/vimrc) as
  your Vim config. Back things up first with:

  `curl -sS -L https://raw.github.com/vivien/vimkickstartr/master/get.sh | sh`;

* List plugins you want to use in your **`~/.vim-addons`** file. For instance:
  <pre>
  " My list of Vim addons
  UltiSnips
  supertab
  fugitive
  </pre>

* On the next start, Vim will fetch the
  [vim-addon-manager](https://github.com/MarcWeber/vim-addon-manager), download
  and activate every plugin you listed.

* Update plugins with `:UpdateAddons`.

Check the VAM documentation for further information: `:he VAM-intro`.
Find some details about plugins with `:he VAM-addon-names`, or check some
[sample addons lists](https://github.com/vivien/vimkickstartr/tree/master/lists).

Goal
----

Some of the main ideas:

* All you need is your .vimrc file;
* The config should be minimalist (no overkill mapping);
* Using a plugin should be as easy as adding its name to a file;
* Pure VimL config (thanks to Marc Weber for 
  [VAM](https://github.com/MarcWeber/vim-addon-manager)!).

Why not another "Vim distribution"?
-----------------------------------

There are other Vim setups, like [Janus](https://github.com/carlhuda/janus)
or [spf13-vim](https://github.com/spf13/spf13-vim), but none will match exactly
your criteria, because:

* They include many plugins you don't care about;
* They depend on a scripting language to install and manage plugins.
* Writing `~/.vimrc.after`, or anything else but your `~/.vimrc`, is pointless.

VimKickStartR's vimrc only contains a clean base for settings, and the setup
code for the addon manager (which is folded).

Feedback
--------

I'd like VimKickStartR to be as simple as possible, and a good base to start.
I'd be glad to receive any feedback or contribution on this setup.
Feel free to send a message/request :-)



Vivien Didelot <vivien@didelot.org>
