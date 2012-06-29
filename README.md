     _   ___         __ ___     __    ______           __
    | | / (_)_ _    / //_(_)___/ /__ / __/ /____ _____/ /_
    | |/ / /  ' \  / ,< / / __/  '_/_\ \/ __/ _ `/ __/ __/
    |___/_/_/_/_/ /_/|_/_/\__/_/\_\/___/\__/\_,_/_/  \__/

Usage
-----

Just put the content of this
[vimrc](https://github.com/v0n/vim-kickstart/blob/master/vimrc) into
your `~/.vimrc` file, and you're ready!

Do it in a safe way (backing up your current Vim config first) with:

    curl -sS -L https://raw.github.com/v0n/vim-kickstart/master/bootstrap.sh | sh

Then, list every plugin you want in your `~/.vim-addons` file.
For instance:

    " My list of Vim addons
    snipmate-snippets
    supertab
    fugitive

To find out some plugin names, checkout some Vim KickStart
[sample addons lists](https://github.com/v0n/vim-kickstart/tree/master/lists), or type `:he VAM-addon-names` from within Vim for details.

On the next start, Vim will fetch the
[vim-addon-manager](https://github.com/MarcWeber/vim-addon-manager),
download and activate every plugin you've listed in `~/.vim-addons`.

See the VAM documentation for useful commands, such as `:UpdateAddons`!

Goal
----

Some of the main ideas:

* All your Vim config is in your .vimrc
* Pure VimL config (thanks to Marc Weber for [VAM](https://github.com/MarcWeber/vim-addon-manager)!)
* Should be flexible and work everywhere (no headache on configuration)
* Using a plugin should be as easy as adding its name to a file
* The config should be minimalist (no overkill mapping)

Why not another "Vim distribution"?
-----------------------------------

There are several other Vim setups, like [Janus](https://github.com/carlhuda/janus)
or [spf13-vim](https://github.com/spf13/spf13-vim), but none will match
your needs exactly (it often includes many plugins you don't care
about). They often depends on a scripting language to install and manage
plugins. Moreover, having a `~/.vimrc.before`, a `~/.vimrc.after`, or
whatever, in addition to your `~/.vimrc`, sucks a lot.

Someone can say this vimrc might get big, but who cares, folding is
made for that (just open this vimrc with Vim to see how it looks) ;)
And another good point is that a single config file is more portable.

So the best solution is to get a nice prepared and documented vimrc as a
base, embedding simple support for plugin management, and tweak it to
fit your needs if necessary!

Contribution
------------

I'd like Vim KickStart to work fine on many platforms, and dealing well with
every Vim version (no crash or error because of dependencies or whatever).
I'd be glad to receive any feedback or contribution on this config.
Feel free to send a message/request :)



Vivien Didelot <vivien@didelot.org>
